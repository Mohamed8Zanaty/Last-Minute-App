import 'package:flutter/material.dart';

const Color purple900 = Color(0xFF6B2DD6);
const Color purple600 = Color(0xFF9B6BFF);
const Color mutedText = Color(0xFF8A86A9);
const Color cardBgLight = Color(0xFFF6F5FF);
const Color yellowBg = Color(0xFFFFF3D6);
const Color yellowText = Color(0xFFB27A00);
const Color greenBg = Color(0xFFE8FFF0);
const Color greenText = Color(0xFF1F9D66);

class AnalysisResultsBody extends StatelessWidget {
  final String generatedOn;
  final VoidCallback onSave;
  final VoidCallback onBook;

  const AnalysisResultsBody({super.key, required this.generatedOn, required this.onSave, required this.onBook});

  @override
  Widget build(BuildContext context) {
    final riskItems = [
      {'title': 'Diabetes Type 2', 'subtitle': 'Blood sugar level analysis', 'percent': 15},
      {'title': 'Stroke Risk', 'subtitle': 'Cardiovascular assessment', 'percent': 45},
      {'title': 'HCC (Liver Cancer)', 'subtitle': 'Liver function analysis', 'percent': 2},
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Card(
        color: cardBgLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('AI Health Analysis Complete', style: TextStyle(fontWeight: FontWeight.w600, color: purple900)),
            const SizedBox(height: 6),
            const Text('Analysis based on symptoms', style: TextStyle(color: mutedText, fontSize: 12)),
            const SizedBox(height: 6),
            Text(generatedOn, style: const TextStyle(color: mutedText, fontSize: 12))
          ]),
        ),
      ),
      const SizedBox(height: 12),
      Column(
        children: riskItems
            .map((it) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RiskCardWidget(
            title: it['title']! as String,
            subtitle: it['subtitle']! as String,
            percent: it['percent']! as int,
            riskLabel: (it['title'] == 'Stroke Risk') ? 'Medium Risk' : ((it['title'] == 'HCC (Liver Cancer)') ? 'No Risk Detected' : 'Low Risk'),
            riskColor: (it['title'] == 'Stroke Risk') ? const Color(0xFFF29C1F) : const Color(0xFF2EB67D),
          ),
        ))
            .toList(),
      ),
      const SizedBox(height: 12),
      RecommendationPillWidget(
        title: '⚠️ Stroke Risk - Medium',
        body: 'Consider lifestyle changes: regular exercise, healthy diet, stress management',
        bg: yellowBg,
        textColor: yellowText,
      ),
      const SizedBox(height: 8),
      RecommendationPillWidget(
        title: '✅ Overall Health - Good',
        body: 'Continue maintaining your current health routine',
        bg: greenBg,
        textColor: greenText,
      ),
      const SizedBox(height: 16),
      Row(children: [
        Expanded(
          flex: 2,
          child: OutlinedButton(
            onPressed: onSave,
            style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Save Report to Records', style: TextStyle(color: purple900)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chat'); // Navigate to chat
            },
            style: ElevatedButton.styleFrom(backgroundColor: purple600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Book Consultation', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ]),
      const SizedBox(height: 12),
      const Text(
        '⚠️ This AI analysis is for informational purposes only and does not replace professional medical advice. Always consult a qualified healthcare provider.',
        style: TextStyle(fontSize: 12, color: mutedText),
      ),
      const SizedBox(height: 24),
    ]);
  }
}

class RiskCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int percent;
  final String riskLabel;
  final Color riskColor;
  const RiskCardWidget({super.key, required this.title, required this.subtitle, required this.percent, required this.riskLabel, required this.riskColor});

  @override
  Widget build(BuildContext context) {
    final double value = (percent.clamp(0, 100)) / 100.0;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: purple900)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: mutedText, fontSize: 12)),
                ])),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(riskLabel, style: TextStyle(color: riskColor, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text('$percent%', style: const TextStyle(color: mutedText, fontSize: 12)),
            ])
          ]),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: value,
              backgroundColor: const Color(0xFFF1F0F6),
              valueColor: const AlwaysStoppedAnimation<Color>(purple600),
            ),
          )
        ]),
      ),
    );
  }
}

class RecommendationPillWidget extends StatelessWidget {
  final String title;
  final String body;
  final Color bg;
  final Color textColor;
  const RecommendationPillWidget({super.key, required this.title, required this.body, required this.bg, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: textColor)),
          const SizedBox(height: 6),
          Text(body, style: TextStyle(color: textColor)),
        ]),
      ),
    );
  }
}
