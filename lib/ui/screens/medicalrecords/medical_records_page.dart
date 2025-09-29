import 'package:flutter/material.dart';

class MedicalRecordsPage extends StatelessWidget {
  const MedicalRecordsPage({super.key});

  final Color _primary = const Color(0xFF6C39E6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'My Medical\nRecords',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2B1E6B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Your health history at a glance',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7B6FA8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.cloud_upload_outlined, size: 18),
                    label: const Text('Upload'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      backgroundColor: Color(0xFF6C39E6),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Stat boxes
              Row(
                children: [
                  Expanded(
                    child: _StatBox(
                      value: '4',
                      label: 'Total Records',
                      color: const Color(0xFFDDE3FF),
                      textColor: const Color(0xFF2B1E6B),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatBox(
                      value: '2',
                      label: 'This Month',
                      color: const Color(0xFFE7D5FF),
                      textColor: const Color(0xFF4A2BAC),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Text(
                'Recent Records',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2B1E6B),
                ),
              ),

              const SizedBox(height: 12),

              // Cards list
              Column(
                children: const [
                  MedicalRecordCard(
                    title: 'Blood Test',
                    date: 'Jan 12, 2025',
                    doctor: 'Dr. Sarah Lee',
                    note: 'Complete blood count - All values within normal range',
                    statusText: 'Normal',
                    statusColor: Colors.teal,
                  ),
                  SizedBox(height: 14),
                  MedicalRecordCard(
                    title: 'Doctor Visit',
                    date: 'Feb 2, 2025',
                    doctor: 'Dr. Emily Chen',
                    note: 'General check-up - Recommended lifestyle changes',
                    statusText: 'Follow-up needed',
                    statusColor: Color(0xFF9B59FF),
                  ),
                  SizedBox(height: 14),
                  MedicalRecordCard(
                    title: 'Vaccination',
                    date: 'Dec 15, 2024',
                    doctor: 'Dr. Michael Rodriguez',
                    note: 'Annual flu vaccine administered',
                    statusText: 'Completed',
                    statusColor: Color(0xFF8F3AED),
                  ),
                  SizedBox(height: 14),
                  MedicalRecordCard(
                    title: 'X-Ray Chest',
                    date: 'Nov 28, 2024',
                    doctor: 'Dr. Omar Hassan',
                    note: 'Chest X-ray - No abnormalities detected',
                    statusText: 'Normal',
                    statusColor: Colors.teal,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // Emergency Access card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                decoration: BoxDecoration(
                  color: _primary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: _primary.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.description_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Emergency Access',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Quick access to critical medical information',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: _primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Access'),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final Color textColor;

  const _StatBox({
    Key? key,
    required this.value,
    required this.label,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor.withOpacity(0.8),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class MedicalRecordCard extends StatelessWidget {
  final String title;
  final String date;
  final String doctor;
  final String note;
  final String statusText;
  final Color statusColor;

  const MedicalRecordCard({
    Key? key,
    required this.title,
    required this.date,
    required this.doctor,
    required this.note,
    required this.statusText,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF6C39E6);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 12, offset: Offset(0, 6))
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 52,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xFFEDEBFF),
                        child: Icon(
                          _iconForTitle(title),
                          color: const Color(0xFF6C39E6),
                          size: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 2,
                        height: 60,
                        color: const Color(0xFFF0EFFF),
                      )
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2B1E6B))),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, size: 14, color: Color(0xFF9E8FCF)),
                          const SizedBox(width: 6),
                          Text(date, style: const TextStyle(color: Color(0xFF9E8FCF), fontSize: 12)),
                          const SizedBox(width: 10),
                          const Icon(Icons.circle, size: 6, color: Color(0xFF9E8FCF)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(doctor, style: const TextStyle(color: Color(0xFF9E8FCF), fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(note, style: const TextStyle(fontSize: 13, color: Color(0xFF6F5E9B))),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.download_outlined, size: 16),
                            label: const Text('Download'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              foregroundColor: primary,
                              side: BorderSide(color: primary.withOpacity(0.2)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {},
                            child: const Text('View Details'),
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xFF6C39E6),
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Status chip top-right
          Positioned(
            right: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: statusColor.withOpacity(0.16)),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor.darken(0.1),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForTitle(String t) {
    final lower = t.toLowerCase();
    if (lower.contains('blood')) return Icons.monitor_heart_outlined;
    if (lower.contains('doctor')) return Icons.local_hospital_outlined;
    if (lower.contains('vacc')) return Icons.vaccines_outlined;
    if (lower.contains('x-ray') || lower.contains('xray')) return Icons.image_outlined;
    return Icons.description_outlined;
  }
}

extension ColorUtils on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final f = 1 - amount;
    return Color.fromARGB(
      alpha,
      (red * f).round(),
      (green * f).round(),
      (blue * f).round(),
    );
  }
}