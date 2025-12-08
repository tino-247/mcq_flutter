import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'connection/connection.dart' as impl; 
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()();
  TextColumn get subCategory => text()();
  TextColumn get questionNumber => text()();
  TextColumn get textContent => text()();
  TextColumn get optionA => text()();
  TextColumn get optionB => text()();
  TextColumn get optionC => text()();
  TextColumn get optionD => text()();
  TextColumn get correctAnswer => text()();
  TextColumn get imageName => text().nullable()();

  // Statistics
  IntColumn get timesAnswered => integer().withDefault(const Constant(0))();
  IntColumn get timesCorrect => integer().withDefault(const Constant(0))();
  IntColumn get timesCorrectRecent => integer().withDefault(const Constant(0))();
  IntColumn get timesChosenA => integer().withDefault(const Constant(0))();
  IntColumn get timesChosenB => integer().withDefault(const Constant(0))();
  IntColumn get timesChosenC => integer().withDefault(const Constant(0))();
  IntColumn get timesChosenD => integer().withDefault(const Constant(0))();
}

@DriftDatabase(tables: [Questions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;

  // --- CSV Logic ---
  Future<void> populateFromCsvIfNeeded() async {
    final count = await (select(questions).get().then((v) => v.length));
    
    // Only populate if empty
    if (count == 0) {
      try {
        final csvString = await rootBundle.loadString('assets/questions.csv');
        
        // 1. Detect Delimiter (Excel often uses semicolon ';')
        // We look at the first line. If it has more ';' than ',', we assume ';'
        final firstLine = csvString.split('\n').first;
        final String delimiter = firstLine.split(';').length > firstLine.split(',').length ? ';' : ',';
        
        print("Detected CSV Delimiter: '$delimiter'");

        // 2. Parse with detected delimiter
        final List<List<dynamic>> rows = CsvToListConverter(
          fieldDelimiter: delimiter, 
          eol: '\n',
          shouldParseNumbers: false, // Force everything as String initially to prevent "numbers" in text fields
        ).convert(csvString);
        
        print("Found ${rows.length} rows in CSV.");

        await batch((batch) {
          // Skip Header (i=1)
          for (var i = 1; i < rows.length; i++) {
            final row = rows[i];
            
            // Safety check for columns
            if (row.length < 9) {
              print("Skipping invalid row $i: $row");
              continue;
            }

            // Debug first row to verify mapping
            if (i == 1) print("Mapping First Row: Cat=${row[0]}, Sub=${row[1]}, Text=${row[3]}");

            batch.insert(questions, QuestionsCompanion.insert(
              category: row[0].toString().trim(),
              subCategory: row[1].toString().trim(),
              questionNumber: row[2].toString().trim(),
              textContent: row[3].toString().trim(),
              optionA: row[4].toString().trim(),
              optionB: row[5].toString().trim(),
              optionC: row[6].toString().trim(),
              optionD: row[7].toString().trim(),
              correctAnswer: row[8].toString().trim(),
              // Handle optional image column
              imageName: Value(row.length > 9 && row[9].toString().trim().isNotEmpty 
                  ? row[9].toString().trim() 
                  : null),
            ));
          }
        });
        print("Database populated successfully.");
      } catch (e) {
        print("CRITICAL CSV ERROR: $e");
      }
    } else {
      print("Database already has data ($count rows). Skipping CSV import.");
    }
  }

  // --- Queries ---
  Future<List<String>> getCategories() async {
    final query = selectOnly(questions, distinct: true)..addColumns([questions.category]);
    final result = await query.get();
    return result.map((r) => r.read(questions.category)!).toList()..sort();
  }

  Future<List<String>> getSubCategories(String cat) async {
    final query = selectOnly(questions, distinct: true)
      ..addColumns([questions.subCategory])
      ..where(questions.category.equals(cat));
    final result = await query.get();
    return result.map((r) => r.read(questions.subCategory)!).toList()..sort();
  }

  Future<List<Question>> getAllQuestions() => select(questions).get();

  Future<List<Question>> getQuizQuestions({
    String? category,
    String? subCategory,
    bool onlyWeak = false,
    int weakThreshold = 3,
    bool onlyUnanswered = false,
    bool onlyIncorrect = false,
  }) async {
    var query = select(questions);

    if (category != null) query.where((t) => t.category.equals(category));
    if (subCategory != null) query.where((t) => t.subCategory.equals(subCategory));

    if (onlyWeak) {
      query.where((t) => t.timesCorrectRecent.isSmallerThanValue(weakThreshold));
    } else if (onlyUnanswered) {
      query.where((t) => t.timesAnswered.equals(0));
    } else if (onlyIncorrect) {
      // Logic: Answered at least once, but total correct is less than total attempts
      query.where((t) => t.timesAnswered.isBiggerThanValue(0) & t.timesCorrect.isSmallerThan(t.timesAnswered));
    }

    query.orderBy([(t) => OrderingTerm.random()]);
    return query.get();
  }

  // --- Update Logic (MATCHES PROVIDER) ---
  Future<void> updateStats(int id, String chosenOption, bool isCorrect) async {
    final q = await (select(questions)..where((t) => t.id.equals(id))).getSingle();
    
    var updateComp = QuestionsCompanion(
      timesAnswered: Value(q.timesAnswered + 1),
      timesCorrect: Value(isCorrect ? q.timesCorrect + 1 : q.timesCorrect),
      timesCorrectRecent: Value(isCorrect ? q.timesCorrectRecent + 1 : 0),
    );

    // Update specific option counts
    if (chosenOption.toUpperCase() == 'A') updateComp = updateComp.copyWith(timesChosenA: Value(q.timesChosenA + 1));
    if (chosenOption.toUpperCase() == 'B') updateComp = updateComp.copyWith(timesChosenB: Value(q.timesChosenB + 1));
    if (chosenOption.toUpperCase() == 'C') updateComp = updateComp.copyWith(timesChosenC: Value(q.timesChosenC + 1));
    if (chosenOption.toUpperCase() == 'D') updateComp = updateComp.copyWith(timesChosenD: Value(q.timesChosenD + 1));

    await (update(questions)..where((t) => t.id.equals(id))).write(updateComp);
  }

  Future<void> resetSubCategoryStats(String cat, String subCat) async {
    await (update(questions)..where((t) => t.category.equals(cat) & t.subCategory.equals(subCat)))
        .write(const QuestionsCompanion(
          timesAnswered: Value(0),
          timesCorrect: Value(0),
          timesCorrectRecent: Value(0),
          timesChosenA: Value(0),
          timesChosenB: Value(0),
          timesChosenC: Value(0),
          timesChosenD: Value(0),
        ));
  }
  
  Future<void> clearAllData() => delete(questions).go();
}
