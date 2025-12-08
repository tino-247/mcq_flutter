import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/database.dart';
import 'providers/quiz_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final database = AppDatabase();
  
  // Create the provider but don't wait for CSV here.
  // We will load CSV in the background.
  final quizProvider = QuizProvider(database);

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: database),
        ChangeNotifierProvider.value(value: quizProvider),
      ],
      child: const MyApp(),
    ),
  );
  
  // Load data in background after UI starts
  _initData(database);
}

Future<void> _initData(AppDatabase db) async {
  try {
    await db.populateFromCsvIfNeeded();
    print("CSV Import complete");
  } catch (e) {
    print("Error initializing data: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQ Trainer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}