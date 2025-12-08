import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../providers/quiz_provider.dart';
import 'quiz_screen.dart';
import 'statistics_screen.dart';
import 'file_operations_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;
  String? selectedSubCategory;
  bool onlyWeak = false;
  final TextEditingController _thresholdCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _thresholdCtrl.text = context.read<QuizProvider>().weakThreshold.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<AppDatabase>();
    final quizProv = context.watch<QuizProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("MCQ Trainer"), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FutureBuilder<List<String>>(
              future: db.getCategories(),
              builder: (ctx, snap) {
                if (!snap.hasData) return const SizedBox();
                final items = ["All Categories", ...snap.data!];
                return DropdownButtonFormField<String>(
                  value: selectedCategory,
                  decoration: const InputDecoration(labelText: "Category", border: OutlineInputBorder()),
                  items: items.map((c) => DropdownMenuItem(value: c == "All Categories" ? null : c, child: Text(c))).toList(),
                  onChanged: (v) => setState(() { selectedCategory = v; selectedSubCategory = null; }),
                );
              },
            ),
            const SizedBox(height: 12),
            if (selectedCategory != null)
              FutureBuilder<List<String>>(
                future: db.getSubCategories(selectedCategory!),
                builder: (ctx, snap) {
                  if (!snap.hasData) return const SizedBox();
                  final items = ["All Subcategories", ...snap.data!];
                  return DropdownButtonFormField<String>(
                    value: selectedSubCategory,
                    decoration: const InputDecoration(labelText: "Sub-Category", border: OutlineInputBorder()),
                    items: items.map((c) => DropdownMenuItem(value: c == "All Subcategories" ? null : c, child: Text(c))).toList(),
                    onChanged: (v) => setState(() => selectedSubCategory = v),
                  );
                },
              ),
            const SizedBox(height: 12),
            TextField(
              controller: _thresholdCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Weak Streak Threshold", border: OutlineInputBorder()),
              onChanged: (v) => quizProv.saveThreshold(int.tryParse(v) ?? 3),
            ),
            CheckboxListTile(
              title: const Text("Only Train Weak Questions"),
              value: onlyWeak,
              onChanged: (v) => setState(() => onlyWeak = v!),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _startQuiz(context),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text("Start Quiz"),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StatisticsScreen())),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text("View Statistics"),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: () => FileOps.exportDb(context), child: const Text("Export DB")),
                OutlinedButton(onPressed: () => FileOps.importDb(context), child: const Text("Import DB")),
              ],
            ),
            TextButton(
              onPressed: () => db.clearAllData().then((_) => setState((){})),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Clear Database"),
            )
          ],
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context) {
    context.read<QuizProvider>().startQuiz(
      category: selectedCategory,
      subCategory: selectedSubCategory,
      onlyWeak: onlyWeak,
    );
    Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
  }
}