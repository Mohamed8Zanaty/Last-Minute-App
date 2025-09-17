// lib/screens/ai_health_check_page.dart
import 'package:flutter/material.dart';

/// Single-file AI Health Check page — contains all UI components in one place.
/// Use by pushing: Navigator.push(context, MaterialPageRoute(builder: (_) => AiHealthCheckPage()));

const Color _purple900 = Color(0xFF6B2DD6);
const Color _purple600 = Color(0xFF9B6BFF);
const Color _mutedText = Color(0xFF8A86A9);
const Color _cardBgLight = Color(0xFFF6F5FF);
const Color _yellowBg = Color(0xFFFFF3D6);
const Color _yellowText = Color(0xFFB27A00);
const Color _greenBg = Color(0xFFE8FFF0);
const Color _greenText = Color(0xFF1F9D66);
const Color _fieldBg = Color(0xFFF6F3FD);
const Color _purple100 = Color(0xFFEFE5FF);

class AiHealthCheckPage extends StatefulWidget {
  const AiHealthCheckPage({super.key});

  @override
  State<AiHealthCheckPage> createState() => _AiHealthCheckPageState();
}

class _AiHealthCheckPageState extends State<AiHealthCheckPage> {
  bool _showAnalysis = false;
  String _generatedOn = 'Generated on N/A';

  void _showResults() {
    final now = DateTime.now();
    setState(() {
      _generatedOn = 'Generated on ${now.month}/${now.day}/${now.year}';
      _showAnalysis = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Health Check'),
        backgroundColor: _purple600,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopBar(),
              const SizedBox(height: 20),
              _UploadLabCard(
                onUploadClick: () {
                  // handle upload
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Upload tapped')));
                },
                onAnalyzeClick: () {
                  // If upload triggers analysis, show results
                  _showResults();
                },
              ),
              const SizedBox(height: 12),
              _SymptomDescribeCard(onAnalyzeClick: (desc, duration) {
                // optionally call backend with desc/duration, then show results
                debugPrint('Analyze -> desc="$desc", duration="$duration"');
                _showResults();
              }),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _showAnalysis
                    ? AnalysisResultsBody(
                  key: const ValueKey('results'),
                  generatedOn: _generatedOn,
                  onSave: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved')));
                  },
                  onBook: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Booked')));
                  },
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

/* ---------------- Top bar inside page ---------------- */

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back, color: _purple600)),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text('Ai Health Check', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _purple600)),
          SizedBox(height: 2),
          Text('Tell us about your symptoms', style: TextStyle(fontSize: 12, color: _mutedText)),
        ]),
      ],
    );
  }
}

/* ---------------- Upload card ---------------- */

class _UploadLabCard extends StatelessWidget {
  final VoidCallback onUploadClick;
  final VoidCallback onAnalyzeClick;
  const _UploadLabCard({required this.onUploadClick, required this.onAnalyzeClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: const [
            Icon(Icons.cloud_upload_rounded, color: _purple900),
            SizedBox(width: 8),
            Text('Upload Lab Results', style: TextStyle(color: _purple900, fontWeight: FontWeight.bold, fontSize: 18)),
          ]),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onUploadClick,
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE6E1F6)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(color: _purple100, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.arrow_upward, size: 28, color: _purple900),
                ),
                const SizedBox(height: 12),
                const Text('Upload your lab results', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _purple900)),
                const SizedBox(height: 6),
                const Text('Supports PDF, JPG, PNG files', style: TextStyle(fontSize: 12, color: _mutedText)),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: _purple600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
              onPressed: onAnalyzeClick,
              child: const Text('Analyze Lab Results', style: TextStyle(color: Colors.white)),
            ),
          )
        ]),
      ),
    );
  }
}

/* ---------------- Symptom describe card ---------------- */

class _SymptomDescribeCard extends StatefulWidget {
  final void Function(String description, String duration) onAnalyzeClick;
  const _SymptomDescribeCard({required this.onAnalyzeClick});

  @override
  State<_SymptomDescribeCard> createState() => _SymptomDescribeCardState();
}

class _SymptomDescribeCardState extends State<_SymptomDescribeCard> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _options = ['Less than 24 hours', '1-2 days', '2-3 days', 'More than a week'];
  String _selected = '2-3 days';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: const [
            Icon(Icons.healing, color: _purple900),
            SizedBox(width: 8),
            Text('Or Describe Your Symptoms', style: TextStyle(color: _purple900, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 12),
          const Text('What symptoms are you experiencing?', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: _fieldBg,
              hintText: 'Describe your symptoms here...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 12),
          const Text('How long have you had these symptoms?', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          SizedBox(
            height: 44,
            child: DropdownButtonFormField<String>(
              value: _selected,
              decoration: InputDecoration(
                filled: true,
                fillColor: _fieldBg,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              items: _options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
              onChanged: (v) => setState(() => _selected = v ?? _selected),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: _purple600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              onPressed: () => widget.onAnalyzeClick(_controller.text, _selected),
              child: const Text('Analyze Symptoms', style: TextStyle(color: Colors.white)),
            ),
          )
        ]),
      ),
    );
  }
}

/* ---------------- Analysis results body (all UI included) ---------------- */

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

    // Top-level full-width container
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header - full width
        SizedBox(
          width: double.infinity,
          child: Card(
            color: _cardBgLight,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('AI Health Analysis Complete', style: TextStyle(fontWeight: FontWeight.w600, color: _purple900)),
                const SizedBox(height: 6),
                const Text('Analysis based on symptoms', style: TextStyle(color: _mutedText, fontSize: 12)),
                const SizedBox(height: 6),
                Text(generatedOn, style: const TextStyle(color: _mutedText, fontSize: 12))
              ]),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Risk items
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

        // Recommendations (full width)
        SizedBox(
          width: double.infinity,
          child: RecommendationPillWidget(
            title: '⚠️ Stroke Risk - Medium',
            body: 'Consider lifestyle changes: regular exercise, healthy diet, stress management',
            bg: _yellowBg,
            textColor: _yellowText,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: RecommendationPillWidget(
            title: '✅ Overall Health - Good',
            body: 'Continue maintaining your current health routine',
            bg: _greenBg,
            textColor: _greenText,
          ),
        ),
        const SizedBox(height: 16),

        // Equal-width buttons using LayoutBuilder for exact pixel equality
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: LayoutBuilder(builder: (context, constraints) {
            final double gap = 12.0;
            final double btnWidth = (constraints.maxWidth - gap) / 2;
            return Row(
              children: [
                SizedBox(
                  width: btnWidth,
                  child: OutlinedButton(
                    onPressed: onSave,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Save Report to Records', style: TextStyle(color: _purple900)),
                  ),
                ),
                SizedBox(width: gap),
                SizedBox(
                  width: btnWidth,
                  child: ElevatedButton(
                    onPressed: onBook,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _purple600,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Book Consultation', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          }),
        ),

        const SizedBox(height: 12),
        const Text(
          '⚠️ This AI analysis is for informational purposes only and does not replace professional medical advice. Always consult a qualified healthcare provider.',
          style: TextStyle(fontSize: 12, color: _mutedText),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}

/* ---------------- Risk card & Recommendation widgets ---------------- */

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
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: _purple900)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: _mutedText, fontSize: 12)),
              ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(riskLabel, style: TextStyle(color: riskColor, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text('$percent%', style: const TextStyle(color: _mutedText, fontSize: 12)),
            ])
          ]),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: value,
              backgroundColor: const Color(0xFFF1F0F6),
              valueColor: const AlwaysStoppedAnimation<Color>(_purple600),
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
    return SizedBox(
      width: double.infinity,
      child: Card(
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
      ),
    );
  }
}
