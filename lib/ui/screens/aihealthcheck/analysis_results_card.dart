// lib/analysis_results_card.dart
import 'package:flutter/material.dart';
import 'api_service.dart';

const Color purple600 = Color(0xFF9B6BFF);
const Color mutedText = Color(0xFF8A86A9);
const Color cardBgLight = Color(0xFFF6F5FF);

class AnalysisResultsCard extends StatelessWidget {
  final ApiResponse response;

  const AnalysisResultsCard({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBgLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AI Analysis Results', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMetric('Probability', '${(response.probability * 100).toStringAsFixed(1)}%'),
                _buildMetric('Risk Level', response.severity),
              ],
            ),
            const Divider(height: 32),
            
            const Text('Key Factors Identified:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ...response.explanationText.map((text) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_outline, color: purple600, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(text, style: const TextStyle(color: mutedText))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: mutedText)),
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purple600)),
      ],
    );
  }
}