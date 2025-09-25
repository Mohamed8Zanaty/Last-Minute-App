import 'package:flutter/material.dart';
import '../../models/clinic.dart';
import '../theme/app_colors.dart';

class ClinicCard extends StatelessWidget {
  final Clinic clinic;
  const ClinicCard({required this.clinic, super.key});

  @override
  Widget build(BuildContext context) {
    const double sharedRadius = 16.0; // same radius as card

    return Card(
      color: cardBg,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sharedRadius)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row: title, category, wait time
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          clinic.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: deepIndigo),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _CategoryChip(text: clinic.category),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      clinic.waitTime,
                      style: const TextStyle(color: purple, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    const Text('wait time', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            // distance + address
            Row(
              children: [
                const Icon(Icons.place, color: purple, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${clinic.distance} • ${clinic.address}',
                    style: const TextStyle(color: Color(0xFF6B6B7A)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            // rating + open info
            Row(
              children: [
                const Icon(Icons.star, color: purple, size: 18),
                const SizedBox(width: 6),
                Text(clinic.rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(clinic.openInfo, style: const TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 12),

            const Text('Services:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 8),

            // services chips (horizontal)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: clinic.services
                    .map((s) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _ServiceChip(text: s),
                ))
                    .toList(),
              ),
            ),

            const SizedBox(height: 14),

            // bottom actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Get directions to ${clinic.name}')),
                      );
                    },
                    icon: const Icon(Icons.place),
                    label: const Text('Get Directions'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sharedRadius)),
                      minimumSize: const Size.fromHeight(46),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // rounded (matching card radius) call button
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(sharedRadius),
                    border: Border.all(color: chipBorder),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Calling ${clinic.name} (not implemented)')),
                      );
                    },
                    icon: const Icon(Icons.phone),
                    color: purple,
                    tooltip: 'Call',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;
  const _CategoryChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}

class _ServiceChip extends StatelessWidget {
  final String text;
  const _ServiceChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: chipBorder),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
