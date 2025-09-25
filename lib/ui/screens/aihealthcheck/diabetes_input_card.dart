// lib/diabetes_input_card.dart

import 'package:flutter/material.dart';

// Using your app's existing colors
const Color purple600 = Color(0xFF9B6BFF);
const Color fieldBg = Color(0xFFF6F3FD);
const Color purple900 = Color(0xFF6B2DD6);

class DiabetesInputCard extends StatefulWidget {
  final bool isLoading;
  final Function(Map<String, dynamic> patientData) onAnalyzeClick;

  const DiabetesInputCard({super.key, required this.isLoading, required this.onAnalyzeClick});

  @override
  State<DiabetesInputCard> createState() => _DiabetesInputCardState();
}

class _DiabetesInputCardState extends State<DiabetesInputCard> {
  final _formKey = GlobalKey<FormState>();
  
  final _ageController = TextEditingController(text: '55');
  final _bmiController = TextEditingController(text: '28.5');
  final _sbpController = TextEditingController(text: '120');
  final _dbpController = TextEditingController(text: '80');
  final _glucoseController = TextEditingController(text: '95');
  final _insulinController = TextEditingController(text: '15');
  final _triglyceridesController = TextEditingController(text: '140');
  final _hscrpController = TextEditingController(text: '2.1');
  
  int _genderValue = 1; // 1 for Male, 2 for Female

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "RIDAGEYR": int.parse(_ageController.text),
        "RIAGENDR": _genderValue,
        "BMXBMI": double.parse(_bmiController.text),
        "BPXSY1": double.parse(_sbpController.text),
        "BPXDI1": double.parse(_dbpController.text),
        "LBXGLU": double.parse(_glucoseController.text),
        "LBXIN": double.parse(_insulinController.text),
        "LBXTR": double.parse(_triglyceridesController.text),
        "LBXHSCRP": double.parse(_hscrpController.text),
      };
      widget.onAnalyzeClick(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.monitor_heart_outlined, color: purple900),
                  SizedBox(width: 8),
                  Text('Enter Diabetes Risk Factors', style: TextStyle(color: purple900, fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(_ageController, 'Age'),
              _buildGenderDropdown(),
              _buildTextField(_bmiController, 'Body Mass Index (BMI)'),
              _buildTextField(_sbpController, 'Systolic Blood Pressure'),
              _buildTextField(_dbpController, 'Diastolic Blood Pressure'),
              _buildTextField(_glucoseController, 'Fasting Glucose (mg/dL)'),
              _buildTextField(_insulinController, 'Insulin Level (µU/mL)'),
              _buildTextField(_triglyceridesController, 'Triglycerides (mg/dL)'),
              _buildTextField(_hscrpController, 'High-Sensitivity CRP (mg/L)'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: purple600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
                  onPressed: widget.isLoading ? null : _submitForm,
                  child: const Text('Analyze Risk', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Helper methods to build form fields consistently
  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: fieldBg,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Please enter a value';
          if (double.tryParse(value) == null) return 'Please enter a valid number';
          return null;
        },
      ),
    );
  }
  
  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<int>(
        value: _genderValue,
        decoration: InputDecoration(labelText: 'Gender', filled: true, fillColor: fieldBg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
        items: const [ DropdownMenuItem(value: 1, child: Text('Male')), DropdownMenuItem(value: 2, child: Text('Female')), ],
        onChanged: (value) { if (value != null) setState(() => _genderValue = value); },
      ),
    );
  }
}