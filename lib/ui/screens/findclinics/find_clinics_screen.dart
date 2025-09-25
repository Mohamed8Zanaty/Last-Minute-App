import 'package:flutter/material.dart';

import '../../../models/clinic.dart';
import '../../widgets/clinic_card.dart';
import '../../widgets/filter_row.dart';
import '../../widgets/interactive_map_card.dart';
import '../../widgets/top_bar.dart';


// sample data
final List<Clinic> sampleClinics = [
  Clinic(
    name: 'Sunrise Clinic',
    category: 'General Practice',
    distance: '0.5 km',
    address: '123 Health Street, Medical District',
    rating: 4.8,
    openInfo: 'Open 24/7',
    services: ['Emergency', 'General Care', 'Pharmacy'],
    waitTime: '~15 min',
  ),
  Clinic(
    name: 'Alex General Hospital',
    category: 'Hospital',
    distance: '1.2 km',
    address: '4 Medical Avenue, Downtown',
    rating: 4.6,
    openInfo: 'Open 24/7',
    services: ['Emergency', 'Surgery', 'ICU', 'Radiology'],
    waitTime: '~45 min',
  ),
];

class FindClinicsScreen extends StatefulWidget {
  const FindClinicsScreen({super.key});

  @override
  State<FindClinicsScreen> createState() => _FindClinicsScreenState();
}

class _FindClinicsScreenState extends State<FindClinicsScreen> {
  final List<String> filters = ['All', 'Emergency', 'Open Now', 'Hospitals'];
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4FB),
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 12),
            InteractiveMapCard(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Open full map (not implemented)')),
                );
              },
            ),
            const SizedBox(height: 8),
            FilterRow(
              filters: filters,
              selectedFilter: selectedFilter,
              onFilterSelected: (f) => setState(() => selectedFilter = f),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: sampleClinics.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final clinic = sampleClinics[index];
                  // you can optionally apply filter logic here
                  return ClinicCard(clinic: clinic);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
