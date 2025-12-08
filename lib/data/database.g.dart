// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<String> subCategory = GeneratedColumn<String>(
      'sub_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionNumberMeta =
      const VerificationMeta('questionNumber');
  @override
  late final GeneratedColumn<String> questionNumber = GeneratedColumn<String>(
      'question_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _textContentMeta =
      const VerificationMeta('textContent');
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
      'text_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionAMeta =
      const VerificationMeta('optionA');
  @override
  late final GeneratedColumn<String> optionA = GeneratedColumn<String>(
      'option_a', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionBMeta =
      const VerificationMeta('optionB');
  @override
  late final GeneratedColumn<String> optionB = GeneratedColumn<String>(
      'option_b', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionCMeta =
      const VerificationMeta('optionC');
  @override
  late final GeneratedColumn<String> optionC = GeneratedColumn<String>(
      'option_c', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionDMeta =
      const VerificationMeta('optionD');
  @override
  late final GeneratedColumn<String> optionD = GeneratedColumn<String>(
      'option_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctAnswerMeta =
      const VerificationMeta('correctAnswer');
  @override
  late final GeneratedColumn<String> correctAnswer = GeneratedColumn<String>(
      'correct_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageNameMeta =
      const VerificationMeta('imageName');
  @override
  late final GeneratedColumn<String> imageName = GeneratedColumn<String>(
      'image_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timesAnsweredMeta =
      const VerificationMeta('timesAnswered');
  @override
  late final GeneratedColumn<int> timesAnswered = GeneratedColumn<int>(
      'times_answered', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timesCorrectMeta =
      const VerificationMeta('timesCorrect');
  @override
  late final GeneratedColumn<int> timesCorrect = GeneratedColumn<int>(
      'times_correct', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timesCorrectRecentMeta =
      const VerificationMeta('timesCorrectRecent');
  @override
  late final GeneratedColumn<int> timesCorrectRecent = GeneratedColumn<int>(
      'times_correct_recent', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timesChosenAMeta =
      const VerificationMeta('timesChosenA');
  @override
  late final GeneratedColumn<int> timesChosenA = GeneratedColumn<int>(
      'times_chosen_a', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timesChosenBMeta =
      const VerificationMeta('timesChosenB');
  @override
  late final GeneratedColumn<int> timesChosenB = GeneratedColumn<int>(
      'times_chosen_b', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timesChosenCMeta =
      const VerificationMeta('timesChosenC');
  @override
  late final GeneratedColumn<int> timesChosenC = GeneratedColumn<int>(
      'times_chosen_c', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timesChosenDMeta =
      const VerificationMeta('timesChosenD');
  @override
  late final GeneratedColumn<int> timesChosenD = GeneratedColumn<int>(
      'times_chosen_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        category,
        subCategory,
        questionNumber,
        textContent,
        optionA,
        optionB,
        optionC,
        optionD,
        correctAnswer,
        imageName,
        timesAnswered,
        timesCorrect,
        timesCorrectRecent,
        timesChosenA,
        timesChosenB,
        timesChosenC,
        timesChosenD
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    if (data.containsKey('question_number')) {
      context.handle(
          _questionNumberMeta,
          questionNumber.isAcceptableOrUnknown(
              data['question_number']!, _questionNumberMeta));
    } else if (isInserting) {
      context.missing(_questionNumberMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
          _textContentMeta,
          textContent.isAcceptableOrUnknown(
              data['text_content']!, _textContentMeta));
    } else if (isInserting) {
      context.missing(_textContentMeta);
    }
    if (data.containsKey('option_a')) {
      context.handle(_optionAMeta,
          optionA.isAcceptableOrUnknown(data['option_a']!, _optionAMeta));
    } else if (isInserting) {
      context.missing(_optionAMeta);
    }
    if (data.containsKey('option_b')) {
      context.handle(_optionBMeta,
          optionB.isAcceptableOrUnknown(data['option_b']!, _optionBMeta));
    } else if (isInserting) {
      context.missing(_optionBMeta);
    }
    if (data.containsKey('option_c')) {
      context.handle(_optionCMeta,
          optionC.isAcceptableOrUnknown(data['option_c']!, _optionCMeta));
    } else if (isInserting) {
      context.missing(_optionCMeta);
    }
    if (data.containsKey('option_d')) {
      context.handle(_optionDMeta,
          optionD.isAcceptableOrUnknown(data['option_d']!, _optionDMeta));
    } else if (isInserting) {
      context.missing(_optionDMeta);
    }
    if (data.containsKey('correct_answer')) {
      context.handle(
          _correctAnswerMeta,
          correctAnswer.isAcceptableOrUnknown(
              data['correct_answer']!, _correctAnswerMeta));
    } else if (isInserting) {
      context.missing(_correctAnswerMeta);
    }
    if (data.containsKey('image_name')) {
      context.handle(_imageNameMeta,
          imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta));
    }
    if (data.containsKey('times_answered')) {
      context.handle(
          _timesAnsweredMeta,
          timesAnswered.isAcceptableOrUnknown(
              data['times_answered']!, _timesAnsweredMeta));
    }
    if (data.containsKey('times_correct')) {
      context.handle(
          _timesCorrectMeta,
          timesCorrect.isAcceptableOrUnknown(
              data['times_correct']!, _timesCorrectMeta));
    }
    if (data.containsKey('times_correct_recent')) {
      context.handle(
          _timesCorrectRecentMeta,
          timesCorrectRecent.isAcceptableOrUnknown(
              data['times_correct_recent']!, _timesCorrectRecentMeta));
    }
    if (data.containsKey('times_chosen_a')) {
      context.handle(
          _timesChosenAMeta,
          timesChosenA.isAcceptableOrUnknown(
              data['times_chosen_a']!, _timesChosenAMeta));
    }
    if (data.containsKey('times_chosen_b')) {
      context.handle(
          _timesChosenBMeta,
          timesChosenB.isAcceptableOrUnknown(
              data['times_chosen_b']!, _timesChosenBMeta));
    }
    if (data.containsKey('times_chosen_c')) {
      context.handle(
          _timesChosenCMeta,
          timesChosenC.isAcceptableOrUnknown(
              data['times_chosen_c']!, _timesChosenCMeta));
    }
    if (data.containsKey('times_chosen_d')) {
      context.handle(
          _timesChosenDMeta,
          timesChosenD.isAcceptableOrUnknown(
              data['times_chosen_d']!, _timesChosenDMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
      questionNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}question_number'])!,
      textContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_content'])!,
      optionA: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_a'])!,
      optionB: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_b'])!,
      optionC: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_c'])!,
      optionD: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_d'])!,
      correctAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}correct_answer'])!,
      imageName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_name']),
      timesAnswered: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_answered'])!,
      timesCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_correct'])!,
      timesCorrectRecent: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}times_correct_recent'])!,
      timesChosenA: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_chosen_a'])!,
      timesChosenB: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_chosen_b'])!,
      timesChosenC: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_chosen_c'])!,
      timesChosenD: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_chosen_d'])!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final int id;
  final String category;
  final String subCategory;
  final String questionNumber;
  final String textContent;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer;
  final String? imageName;
  final int timesAnswered;
  final int timesCorrect;
  final int timesCorrectRecent;
  final int timesChosenA;
  final int timesChosenB;
  final int timesChosenC;
  final int timesChosenD;
  const Question(
      {required this.id,
      required this.category,
      required this.subCategory,
      required this.questionNumber,
      required this.textContent,
      required this.optionA,
      required this.optionB,
      required this.optionC,
      required this.optionD,
      required this.correctAnswer,
      this.imageName,
      required this.timesAnswered,
      required this.timesCorrect,
      required this.timesCorrectRecent,
      required this.timesChosenA,
      required this.timesChosenB,
      required this.timesChosenC,
      required this.timesChosenD});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['sub_category'] = Variable<String>(subCategory);
    map['question_number'] = Variable<String>(questionNumber);
    map['text_content'] = Variable<String>(textContent);
    map['option_a'] = Variable<String>(optionA);
    map['option_b'] = Variable<String>(optionB);
    map['option_c'] = Variable<String>(optionC);
    map['option_d'] = Variable<String>(optionD);
    map['correct_answer'] = Variable<String>(correctAnswer);
    if (!nullToAbsent || imageName != null) {
      map['image_name'] = Variable<String>(imageName);
    }
    map['times_answered'] = Variable<int>(timesAnswered);
    map['times_correct'] = Variable<int>(timesCorrect);
    map['times_correct_recent'] = Variable<int>(timesCorrectRecent);
    map['times_chosen_a'] = Variable<int>(timesChosenA);
    map['times_chosen_b'] = Variable<int>(timesChosenB);
    map['times_chosen_c'] = Variable<int>(timesChosenC);
    map['times_chosen_d'] = Variable<int>(timesChosenD);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      category: Value(category),
      subCategory: Value(subCategory),
      questionNumber: Value(questionNumber),
      textContent: Value(textContent),
      optionA: Value(optionA),
      optionB: Value(optionB),
      optionC: Value(optionC),
      optionD: Value(optionD),
      correctAnswer: Value(correctAnswer),
      imageName: imageName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageName),
      timesAnswered: Value(timesAnswered),
      timesCorrect: Value(timesCorrect),
      timesCorrectRecent: Value(timesCorrectRecent),
      timesChosenA: Value(timesChosenA),
      timesChosenB: Value(timesChosenB),
      timesChosenC: Value(timesChosenC),
      timesChosenD: Value(timesChosenD),
    );
  }

  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      questionNumber: serializer.fromJson<String>(json['questionNumber']),
      textContent: serializer.fromJson<String>(json['textContent']),
      optionA: serializer.fromJson<String>(json['optionA']),
      optionB: serializer.fromJson<String>(json['optionB']),
      optionC: serializer.fromJson<String>(json['optionC']),
      optionD: serializer.fromJson<String>(json['optionD']),
      correctAnswer: serializer.fromJson<String>(json['correctAnswer']),
      imageName: serializer.fromJson<String?>(json['imageName']),
      timesAnswered: serializer.fromJson<int>(json['timesAnswered']),
      timesCorrect: serializer.fromJson<int>(json['timesCorrect']),
      timesCorrectRecent: serializer.fromJson<int>(json['timesCorrectRecent']),
      timesChosenA: serializer.fromJson<int>(json['timesChosenA']),
      timesChosenB: serializer.fromJson<int>(json['timesChosenB']),
      timesChosenC: serializer.fromJson<int>(json['timesChosenC']),
      timesChosenD: serializer.fromJson<int>(json['timesChosenD']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'subCategory': serializer.toJson<String>(subCategory),
      'questionNumber': serializer.toJson<String>(questionNumber),
      'textContent': serializer.toJson<String>(textContent),
      'optionA': serializer.toJson<String>(optionA),
      'optionB': serializer.toJson<String>(optionB),
      'optionC': serializer.toJson<String>(optionC),
      'optionD': serializer.toJson<String>(optionD),
      'correctAnswer': serializer.toJson<String>(correctAnswer),
      'imageName': serializer.toJson<String?>(imageName),
      'timesAnswered': serializer.toJson<int>(timesAnswered),
      'timesCorrect': serializer.toJson<int>(timesCorrect),
      'timesCorrectRecent': serializer.toJson<int>(timesCorrectRecent),
      'timesChosenA': serializer.toJson<int>(timesChosenA),
      'timesChosenB': serializer.toJson<int>(timesChosenB),
      'timesChosenC': serializer.toJson<int>(timesChosenC),
      'timesChosenD': serializer.toJson<int>(timesChosenD),
    };
  }

  Question copyWith(
          {int? id,
          String? category,
          String? subCategory,
          String? questionNumber,
          String? textContent,
          String? optionA,
          String? optionB,
          String? optionC,
          String? optionD,
          String? correctAnswer,
          Value<String?> imageName = const Value.absent(),
          int? timesAnswered,
          int? timesCorrect,
          int? timesCorrectRecent,
          int? timesChosenA,
          int? timesChosenB,
          int? timesChosenC,
          int? timesChosenD}) =>
      Question(
        id: id ?? this.id,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        questionNumber: questionNumber ?? this.questionNumber,
        textContent: textContent ?? this.textContent,
        optionA: optionA ?? this.optionA,
        optionB: optionB ?? this.optionB,
        optionC: optionC ?? this.optionC,
        optionD: optionD ?? this.optionD,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        imageName: imageName.present ? imageName.value : this.imageName,
        timesAnswered: timesAnswered ?? this.timesAnswered,
        timesCorrect: timesCorrect ?? this.timesCorrect,
        timesCorrectRecent: timesCorrectRecent ?? this.timesCorrectRecent,
        timesChosenA: timesChosenA ?? this.timesChosenA,
        timesChosenB: timesChosenB ?? this.timesChosenB,
        timesChosenC: timesChosenC ?? this.timesChosenC,
        timesChosenD: timesChosenD ?? this.timesChosenD,
      );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
      questionNumber: data.questionNumber.present
          ? data.questionNumber.value
          : this.questionNumber,
      textContent:
          data.textContent.present ? data.textContent.value : this.textContent,
      optionA: data.optionA.present ? data.optionA.value : this.optionA,
      optionB: data.optionB.present ? data.optionB.value : this.optionB,
      optionC: data.optionC.present ? data.optionC.value : this.optionC,
      optionD: data.optionD.present ? data.optionD.value : this.optionD,
      correctAnswer: data.correctAnswer.present
          ? data.correctAnswer.value
          : this.correctAnswer,
      imageName: data.imageName.present ? data.imageName.value : this.imageName,
      timesAnswered: data.timesAnswered.present
          ? data.timesAnswered.value
          : this.timesAnswered,
      timesCorrect: data.timesCorrect.present
          ? data.timesCorrect.value
          : this.timesCorrect,
      timesCorrectRecent: data.timesCorrectRecent.present
          ? data.timesCorrectRecent.value
          : this.timesCorrectRecent,
      timesChosenA: data.timesChosenA.present
          ? data.timesChosenA.value
          : this.timesChosenA,
      timesChosenB: data.timesChosenB.present
          ? data.timesChosenB.value
          : this.timesChosenB,
      timesChosenC: data.timesChosenC.present
          ? data.timesChosenC.value
          : this.timesChosenC,
      timesChosenD: data.timesChosenD.present
          ? data.timesChosenD.value
          : this.timesChosenD,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('subCategory: $subCategory, ')
          ..write('questionNumber: $questionNumber, ')
          ..write('textContent: $textContent, ')
          ..write('optionA: $optionA, ')
          ..write('optionB: $optionB, ')
          ..write('optionC: $optionC, ')
          ..write('optionD: $optionD, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('imageName: $imageName, ')
          ..write('timesAnswered: $timesAnswered, ')
          ..write('timesCorrect: $timesCorrect, ')
          ..write('timesCorrectRecent: $timesCorrectRecent, ')
          ..write('timesChosenA: $timesChosenA, ')
          ..write('timesChosenB: $timesChosenB, ')
          ..write('timesChosenC: $timesChosenC, ')
          ..write('timesChosenD: $timesChosenD')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      category,
      subCategory,
      questionNumber,
      textContent,
      optionA,
      optionB,
      optionC,
      optionD,
      correctAnswer,
      imageName,
      timesAnswered,
      timesCorrect,
      timesCorrectRecent,
      timesChosenA,
      timesChosenB,
      timesChosenC,
      timesChosenD);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.category == this.category &&
          other.subCategory == this.subCategory &&
          other.questionNumber == this.questionNumber &&
          other.textContent == this.textContent &&
          other.optionA == this.optionA &&
          other.optionB == this.optionB &&
          other.optionC == this.optionC &&
          other.optionD == this.optionD &&
          other.correctAnswer == this.correctAnswer &&
          other.imageName == this.imageName &&
          other.timesAnswered == this.timesAnswered &&
          other.timesCorrect == this.timesCorrect &&
          other.timesCorrectRecent == this.timesCorrectRecent &&
          other.timesChosenA == this.timesChosenA &&
          other.timesChosenB == this.timesChosenB &&
          other.timesChosenC == this.timesChosenC &&
          other.timesChosenD == this.timesChosenD);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> subCategory;
  final Value<String> questionNumber;
  final Value<String> textContent;
  final Value<String> optionA;
  final Value<String> optionB;
  final Value<String> optionC;
  final Value<String> optionD;
  final Value<String> correctAnswer;
  final Value<String?> imageName;
  final Value<int> timesAnswered;
  final Value<int> timesCorrect;
  final Value<int> timesCorrectRecent;
  final Value<int> timesChosenA;
  final Value<int> timesChosenB;
  final Value<int> timesChosenC;
  final Value<int> timesChosenD;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.questionNumber = const Value.absent(),
    this.textContent = const Value.absent(),
    this.optionA = const Value.absent(),
    this.optionB = const Value.absent(),
    this.optionC = const Value.absent(),
    this.optionD = const Value.absent(),
    this.correctAnswer = const Value.absent(),
    this.imageName = const Value.absent(),
    this.timesAnswered = const Value.absent(),
    this.timesCorrect = const Value.absent(),
    this.timesCorrectRecent = const Value.absent(),
    this.timesChosenA = const Value.absent(),
    this.timesChosenB = const Value.absent(),
    this.timesChosenC = const Value.absent(),
    this.timesChosenD = const Value.absent(),
  });
  QuestionsCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String subCategory,
    required String questionNumber,
    required String textContent,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required String correctAnswer,
    this.imageName = const Value.absent(),
    this.timesAnswered = const Value.absent(),
    this.timesCorrect = const Value.absent(),
    this.timesCorrectRecent = const Value.absent(),
    this.timesChosenA = const Value.absent(),
    this.timesChosenB = const Value.absent(),
    this.timesChosenC = const Value.absent(),
    this.timesChosenD = const Value.absent(),
  })  : category = Value(category),
        subCategory = Value(subCategory),
        questionNumber = Value(questionNumber),
        textContent = Value(textContent),
        optionA = Value(optionA),
        optionB = Value(optionB),
        optionC = Value(optionC),
        optionD = Value(optionD),
        correctAnswer = Value(correctAnswer);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? subCategory,
    Expression<String>? questionNumber,
    Expression<String>? textContent,
    Expression<String>? optionA,
    Expression<String>? optionB,
    Expression<String>? optionC,
    Expression<String>? optionD,
    Expression<String>? correctAnswer,
    Expression<String>? imageName,
    Expression<int>? timesAnswered,
    Expression<int>? timesCorrect,
    Expression<int>? timesCorrectRecent,
    Expression<int>? timesChosenA,
    Expression<int>? timesChosenB,
    Expression<int>? timesChosenC,
    Expression<int>? timesChosenD,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (subCategory != null) 'sub_category': subCategory,
      if (questionNumber != null) 'question_number': questionNumber,
      if (textContent != null) 'text_content': textContent,
      if (optionA != null) 'option_a': optionA,
      if (optionB != null) 'option_b': optionB,
      if (optionC != null) 'option_c': optionC,
      if (optionD != null) 'option_d': optionD,
      if (correctAnswer != null) 'correct_answer': correctAnswer,
      if (imageName != null) 'image_name': imageName,
      if (timesAnswered != null) 'times_answered': timesAnswered,
      if (timesCorrect != null) 'times_correct': timesCorrect,
      if (timesCorrectRecent != null)
        'times_correct_recent': timesCorrectRecent,
      if (timesChosenA != null) 'times_chosen_a': timesChosenA,
      if (timesChosenB != null) 'times_chosen_b': timesChosenB,
      if (timesChosenC != null) 'times_chosen_c': timesChosenC,
      if (timesChosenD != null) 'times_chosen_d': timesChosenD,
    });
  }

  QuestionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? category,
      Value<String>? subCategory,
      Value<String>? questionNumber,
      Value<String>? textContent,
      Value<String>? optionA,
      Value<String>? optionB,
      Value<String>? optionC,
      Value<String>? optionD,
      Value<String>? correctAnswer,
      Value<String?>? imageName,
      Value<int>? timesAnswered,
      Value<int>? timesCorrect,
      Value<int>? timesCorrectRecent,
      Value<int>? timesChosenA,
      Value<int>? timesChosenB,
      Value<int>? timesChosenC,
      Value<int>? timesChosenD}) {
    return QuestionsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      questionNumber: questionNumber ?? this.questionNumber,
      textContent: textContent ?? this.textContent,
      optionA: optionA ?? this.optionA,
      optionB: optionB ?? this.optionB,
      optionC: optionC ?? this.optionC,
      optionD: optionD ?? this.optionD,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      imageName: imageName ?? this.imageName,
      timesAnswered: timesAnswered ?? this.timesAnswered,
      timesCorrect: timesCorrect ?? this.timesCorrect,
      timesCorrectRecent: timesCorrectRecent ?? this.timesCorrectRecent,
      timesChosenA: timesChosenA ?? this.timesChosenA,
      timesChosenB: timesChosenB ?? this.timesChosenB,
      timesChosenC: timesChosenC ?? this.timesChosenC,
      timesChosenD: timesChosenD ?? this.timesChosenD,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    if (questionNumber.present) {
      map['question_number'] = Variable<String>(questionNumber.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (optionA.present) {
      map['option_a'] = Variable<String>(optionA.value);
    }
    if (optionB.present) {
      map['option_b'] = Variable<String>(optionB.value);
    }
    if (optionC.present) {
      map['option_c'] = Variable<String>(optionC.value);
    }
    if (optionD.present) {
      map['option_d'] = Variable<String>(optionD.value);
    }
    if (correctAnswer.present) {
      map['correct_answer'] = Variable<String>(correctAnswer.value);
    }
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
    }
    if (timesAnswered.present) {
      map['times_answered'] = Variable<int>(timesAnswered.value);
    }
    if (timesCorrect.present) {
      map['times_correct'] = Variable<int>(timesCorrect.value);
    }
    if (timesCorrectRecent.present) {
      map['times_correct_recent'] = Variable<int>(timesCorrectRecent.value);
    }
    if (timesChosenA.present) {
      map['times_chosen_a'] = Variable<int>(timesChosenA.value);
    }
    if (timesChosenB.present) {
      map['times_chosen_b'] = Variable<int>(timesChosenB.value);
    }
    if (timesChosenC.present) {
      map['times_chosen_c'] = Variable<int>(timesChosenC.value);
    }
    if (timesChosenD.present) {
      map['times_chosen_d'] = Variable<int>(timesChosenD.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('subCategory: $subCategory, ')
          ..write('questionNumber: $questionNumber, ')
          ..write('textContent: $textContent, ')
          ..write('optionA: $optionA, ')
          ..write('optionB: $optionB, ')
          ..write('optionC: $optionC, ')
          ..write('optionD: $optionD, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('imageName: $imageName, ')
          ..write('timesAnswered: $timesAnswered, ')
          ..write('timesCorrect: $timesCorrect, ')
          ..write('timesCorrectRecent: $timesCorrectRecent, ')
          ..write('timesChosenA: $timesChosenA, ')
          ..write('timesChosenB: $timesChosenB, ')
          ..write('timesChosenC: $timesChosenC, ')
          ..write('timesChosenD: $timesChosenD')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [questions];
}

typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  Value<int> id,
  required String category,
  required String subCategory,
  required String questionNumber,
  required String textContent,
  required String optionA,
  required String optionB,
  required String optionC,
  required String optionD,
  required String correctAnswer,
  Value<String?> imageName,
  Value<int> timesAnswered,
  Value<int> timesCorrect,
  Value<int> timesCorrectRecent,
  Value<int> timesChosenA,
  Value<int> timesChosenB,
  Value<int> timesChosenC,
  Value<int> timesChosenD,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<int> id,
  Value<String> category,
  Value<String> subCategory,
  Value<String> questionNumber,
  Value<String> textContent,
  Value<String> optionA,
  Value<String> optionB,
  Value<String> optionC,
  Value<String> optionD,
  Value<String> correctAnswer,
  Value<String?> imageName,
  Value<int> timesAnswered,
  Value<int> timesCorrect,
  Value<int> timesCorrectRecent,
  Value<int> timesChosenA,
  Value<int> timesChosenB,
  Value<int> timesChosenC,
  Value<int> timesChosenD,
});

class $$QuestionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder> {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$QuestionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$QuestionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> subCategory = const Value.absent(),
            Value<String> questionNumber = const Value.absent(),
            Value<String> textContent = const Value.absent(),
            Value<String> optionA = const Value.absent(),
            Value<String> optionB = const Value.absent(),
            Value<String> optionC = const Value.absent(),
            Value<String> optionD = const Value.absent(),
            Value<String> correctAnswer = const Value.absent(),
            Value<String?> imageName = const Value.absent(),
            Value<int> timesAnswered = const Value.absent(),
            Value<int> timesCorrect = const Value.absent(),
            Value<int> timesCorrectRecent = const Value.absent(),
            Value<int> timesChosenA = const Value.absent(),
            Value<int> timesChosenB = const Value.absent(),
            Value<int> timesChosenC = const Value.absent(),
            Value<int> timesChosenD = const Value.absent(),
          }) =>
              QuestionsCompanion(
            id: id,
            category: category,
            subCategory: subCategory,
            questionNumber: questionNumber,
            textContent: textContent,
            optionA: optionA,
            optionB: optionB,
            optionC: optionC,
            optionD: optionD,
            correctAnswer: correctAnswer,
            imageName: imageName,
            timesAnswered: timesAnswered,
            timesCorrect: timesCorrect,
            timesCorrectRecent: timesCorrectRecent,
            timesChosenA: timesChosenA,
            timesChosenB: timesChosenB,
            timesChosenC: timesChosenC,
            timesChosenD: timesChosenD,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String category,
            required String subCategory,
            required String questionNumber,
            required String textContent,
            required String optionA,
            required String optionB,
            required String optionC,
            required String optionD,
            required String correctAnswer,
            Value<String?> imageName = const Value.absent(),
            Value<int> timesAnswered = const Value.absent(),
            Value<int> timesCorrect = const Value.absent(),
            Value<int> timesCorrectRecent = const Value.absent(),
            Value<int> timesChosenA = const Value.absent(),
            Value<int> timesChosenB = const Value.absent(),
            Value<int> timesChosenC = const Value.absent(),
            Value<int> timesChosenD = const Value.absent(),
          }) =>
              QuestionsCompanion.insert(
            id: id,
            category: category,
            subCategory: subCategory,
            questionNumber: questionNumber,
            textContent: textContent,
            optionA: optionA,
            optionB: optionB,
            optionC: optionC,
            optionD: optionD,
            correctAnswer: correctAnswer,
            imageName: imageName,
            timesAnswered: timesAnswered,
            timesCorrect: timesCorrect,
            timesCorrectRecent: timesCorrectRecent,
            timesChosenA: timesChosenA,
            timesChosenB: timesChosenB,
            timesChosenC: timesChosenC,
            timesChosenD: timesChosenD,
          ),
        ));
}

class $$QuestionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get questionNumber => $state.composableBuilder(
      column: $state.table.questionNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get textContent => $state.composableBuilder(
      column: $state.table.textContent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get optionA => $state.composableBuilder(
      column: $state.table.optionA,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get optionB => $state.composableBuilder(
      column: $state.table.optionB,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get optionC => $state.composableBuilder(
      column: $state.table.optionC,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get optionD => $state.composableBuilder(
      column: $state.table.optionD,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get correctAnswer => $state.composableBuilder(
      column: $state.table.correctAnswer,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageName => $state.composableBuilder(
      column: $state.table.imageName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesAnswered => $state.composableBuilder(
      column: $state.table.timesAnswered,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesCorrect => $state.composableBuilder(
      column: $state.table.timesCorrect,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesCorrectRecent => $state.composableBuilder(
      column: $state.table.timesCorrectRecent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesChosenA => $state.composableBuilder(
      column: $state.table.timesChosenA,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesChosenB => $state.composableBuilder(
      column: $state.table.timesChosenB,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesChosenC => $state.composableBuilder(
      column: $state.table.timesChosenC,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timesChosenD => $state.composableBuilder(
      column: $state.table.timesChosenD,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$QuestionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get questionNumber => $state.composableBuilder(
      column: $state.table.questionNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get textContent => $state.composableBuilder(
      column: $state.table.textContent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get optionA => $state.composableBuilder(
      column: $state.table.optionA,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get optionB => $state.composableBuilder(
      column: $state.table.optionB,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get optionC => $state.composableBuilder(
      column: $state.table.optionC,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get optionD => $state.composableBuilder(
      column: $state.table.optionD,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get correctAnswer => $state.composableBuilder(
      column: $state.table.correctAnswer,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageName => $state.composableBuilder(
      column: $state.table.imageName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesAnswered => $state.composableBuilder(
      column: $state.table.timesAnswered,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesCorrect => $state.composableBuilder(
      column: $state.table.timesCorrect,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesCorrectRecent => $state.composableBuilder(
      column: $state.table.timesCorrectRecent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesChosenA => $state.composableBuilder(
      column: $state.table.timesChosenA,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesChosenB => $state.composableBuilder(
      column: $state.table.timesChosenB,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesChosenC => $state.composableBuilder(
      column: $state.table.timesChosenC,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timesChosenD => $state.composableBuilder(
      column: $state.table.timesChosenD,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
}
