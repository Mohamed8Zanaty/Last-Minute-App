import 'package:flutter/material.dart';

const Color purple900 = Color(0xFF6B2DD6);
const Color purple600 = Color(0xFF9B6BFF);
const Color fieldBg = Color(0xFFF6F3FD);
const Color mutedText = Color(0xFF8A86A9);

class SymptomDescribeCard extends StatefulWidget {
  final void Function(String description, String duration) onAnalyzeClick;
  const SymptomDescribeCard({super.key, required this.onAnalyzeClick});

  @override
  State<SymptomDescribeCard> createState() => _SymptomDescribeCardState();
}

class _SymptomDescribeCardState extends State<SymptomDescribeCard> {
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
            Icon(Icons.healing, color: purple900),
            SizedBox(width: 8),
            Text('Or Describe Your Symptoms', style: TextStyle(color: purple900, fontWeight: FontWeight.w600))
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
              fillColor: fieldBg,
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
                fillColor: fieldBg,
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
              style: ElevatedButton.styleFrom(backgroundColor: purple600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              onPressed: () => widget.onAnalyzeClick(_controller.text, _selected),
              child: const Text('Analyze Symptoms', style: TextStyle(color: Colors.white)),
            ),
          )
        ]),
      ),
    );
  }
}
