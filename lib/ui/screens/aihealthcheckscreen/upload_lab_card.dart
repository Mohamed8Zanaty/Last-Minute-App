import 'package:flutter/material.dart';

const Color purple900 = Color(0xFF6B2DD6);
const Color purple600 = Color(0xFF9B6BFF);
const Color mutedText = Color(0xFF8A86A9);

class UploadLabCard extends StatelessWidget {
  final VoidCallback onUploadClick;
  final VoidCallback onAnalyzeClick;
  const UploadLabCard({super.key, required this.onUploadClick, required this.onAnalyzeClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: const [
            Icon(Icons.upload_rounded, color: purple900),
            SizedBox(width: 8),
            Text('Upload Lab Results', style: TextStyle(color: purple900, fontWeight: FontWeight.bold, fontSize: 18))
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
                  decoration: BoxDecoration(color: const Color(0xFFEFE5FF), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.arrow_upward, size: 28, color: purple900),
                ),
                const SizedBox(height: 12),
                const Text('Upload your lab results', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: purple900)),
                const SizedBox(height: 6),
                const Text('Supports PDF, JPG, PNG files', style: TextStyle(fontSize: 12, color: mutedText)),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: purple600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
              onPressed: onAnalyzeClick,
              child: const Text('Analyze Lab Results', style: TextStyle(color: Colors.white)),
            ),
          )
        ]),
      ),
    );
  }
}
