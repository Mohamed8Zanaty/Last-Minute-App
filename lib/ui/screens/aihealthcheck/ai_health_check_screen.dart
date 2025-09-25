import 'package:flutter/material.dart';
import 'ai_topbar.dart';
import 'analysis_results.dart';
import 'symptom_describe_card.dart';
import 'upload_lab_card.dart';

class AiHealthCheckPage extends StatefulWidget {
  const AiHealthCheckPage({super.key});
  @override
  State<AiHealthCheckPage> createState() => _AiHealthCheckPageState();
}

class _AiHealthCheckPageState extends State<AiHealthCheckPage> {
  bool showAnalysis = false;
  String generatedOn = 'Generated on N/A';

  void _showResults() {
    final now = DateTime.now();
    setState(() {
      generatedOn = 'Generated on ${now.month}/${now.day}/${now.year}';
      showAnalysis = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              const SizedBox(height: 20),
              UploadLabCard(
                // save uploaded data and send it to the model
                onUploadClick: () {
                },
                onAnalyzeClick: () {
                  _showResults();
                },
              ),
              const SizedBox(height: 12),
              SymptomDescribeCard(onAnalyzeClick: (desc, duration) {
                // Optionally call backend with desc/duration, then show results
                _showResults();
              }),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: showAnalysis
                    ? AnalysisResultsBody(
                  key: const ValueKey('results'),
                  generatedOn: generatedOn,
                  onSave: () {/* save action */},
                  onBook: () {/* book action */},
                )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
