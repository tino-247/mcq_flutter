import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../providers/quiz_provider.dart';
import 'quiz_screen.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});
  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final db = context.watch<AppDatabase>();

    return Scaffold(
      appBar: AppBar(title: const Text("Statistics")),
      body: FutureBuilder<List<Question>>(
        future: db.getAllQuestions(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          
          final list = snap.data!;
          final Map<String, Map<String, List<Question>>> grouped = {};
          
          for (var q in list) {
            grouped.putIfAbsent(q.category, () => {});
            grouped[q.category]!.putIfAbsent(q.subCategory, () => []);
            grouped[q.category]![q.subCategory]!.add(q);
          }

          int total = list.length;
          int answered = list.where((q) => q.timesAnswered > 0).length;

          return ListView(
            children: [
              ListTile(
                title: const Text("Overall Summary", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Questions: $total | Answered: $answered"),
                tileColor: Colors.grey.shade200,
              ),
              ...grouped.entries.map((catEntry) {
                return ExpansionTile(
                  title: Text(catEntry.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                  initiallyExpanded: true,
                  children: catEntry.value.entries.map((subEntry) {
                    final subCat = subEntry.key;
                    final questions = subEntry.value;
                    
                    int distinctAns = questions.where((q) => q.timesAnswered > 0).length;
                    int totalCorrect = questions.fold(0, (sum, q) => sum + q.timesCorrect);
                    int totalAttempts = questions.fold(0, (sum, q) => sum + q.timesAnswered);
                    double avg = totalAttempts == 0 ? 0 : (totalCorrect/totalAttempts * 100);

                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subCat, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text("Answered: $distinctAns / ${questions.length}"),
                            Text("Avg Correctness: ${avg.toStringAsFixed(0)}%"),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: [
                                _btn("All", () => _go(ctx, catEntry.key, subCat, "ALL")),
                                _btn("Unanswered", () => _go(ctx, catEntry.key, subCat, "UN")),
                                _btn("Weak", () => _go(ctx, catEntry.key, subCat, "WEAK")),
                                IconButton(
                                  icon: const Icon(Icons.refresh, size: 20, color: Colors.red),
                                  onPressed: () async {
                                    await db.resetSubCategoryStats(catEntry.key, subCat);
                                    (ctx as Element).markNeedsBuild();
                                  }, 
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }).toList()
            ],
          );
        },
      ),
    );
  }

  Widget _btn(String txt, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap, 
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        minimumSize: const Size(0, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      child: Text(txt, style: const TextStyle(fontSize: 12)),
    );
  }

  void _go(BuildContext context, String cat, String sub, String mode) {
    final prov = context.read<QuizProvider>();
    if (mode == "ALL") prov.startQuiz(category: cat, subCategory: sub);
    if (mode == "UN") prov.startQuiz(category: cat, subCategory: sub, onlyUnanswered: true);
    if (mode == "WEAK") prov.startQuiz(category: cat, subCategory: sub, onlyWeak: true);
    
    Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
  }
}