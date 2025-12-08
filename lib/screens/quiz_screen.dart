import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedOption;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    final q = provider.currentQuestion;

    if (!provider.isQuizActive || q == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Results")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Finished!", style: Theme.of(context).textTheme.headlineMedium),
              Text("Score: ${provider.score} / ${provider.questions.length}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Back to Home"))
            ],
          ),
        ),
      );
    }

    double percent = q.timesAnswered == 0 ? 0.0 : (q.timesCorrect / q.timesAnswered * 100);

    return Scaffold(
      appBar: AppBar(title: Text("Question ${provider.currentIndex + 1}/${provider.questions.length}")),
      body: Column(
        children: [
          // Top Stats Bar
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(q.questionNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Ans: ${q.timesAnswered} | Ok: ${percent.toStringAsFixed(0)}%"),
                Text("Streak: ${q.timesCorrectRecent}"),
              ],
            ),
          ),
          
          // Image Area (Flexible)
          if (q.imageName != null)
            Expanded(
              flex: 1, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  // CHANGED HERE: 'abbildung_' -> 'picture_'
                  "assets/images/picture_${q.imageName}.jpg",
                  fit: BoxFit.contain,
                  errorBuilder: (_,__,___) => const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                ),
              ),
            ),

          // Question Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(q.textContent, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
          ),

          // Options (Scrollable area)
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                _buildOption("A", q.optionA, q.correctAnswer),
                _buildOption("B", q.optionB, q.correctAnswer),
                _buildOption("C", q.optionC, q.correctAnswer),
                _buildOption("D", q.optionD, q.correctAnswer),
              ],
            ),
          ),

          // Submit Button (Fixed Bottom)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: submitted ? null : _submit,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Submit Answer", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String letter, String text, String correctLetter) {
    Color? color;
    // Normalize to compare safely
    bool isCorrect = letter.trim().toUpperCase() == correctLetter.trim().toUpperCase();
    
    if (selectedOption == letter) {
      if (isCorrect) color = Colors.green.shade100;
      else if (submitted) color = Colors.red.shade100;
    } else if (submitted && isCorrect) {
      color = Colors.green.shade100;
    }

    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: RadioListTile<String>(
        title: Text(text),
        value: letter,
        groupValue: selectedOption,
        onChanged: submitted ? null : (v) => setState(() => selectedOption = v),
        secondary: CircleAvatar(child: Text(letter)),
      ),
    );
  }

  void _submit() {
    if (selectedOption == null) return;
    setState(() => submitted = true);
    
    Future.delayed(const Duration(milliseconds: 1500), () {
      context.read<QuizProvider>().answerQuestion(selectedOption!);
      if (mounted) setState(() { submitted = false; selectedOption = null; });
    });
  }
}