// lib/ai_health_check_screen.dart
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'diabetes_input_card.dart';
import 'analysis_results_card.dart';
import 'ai_topbar.dart';

class AiHealthCheckPage extends StatefulWidget {
  const AiHealthCheckPage({super.key});

  @override
  State<AiHealthCheckPage> createState() => _AiHealthCheckPageState();
}

class _AiHealthCheckPageState extends State<AiHealthCheckPage> {
  bool _isLoading = false;
  ApiResponse? _apiResponse;
  String? _errorMessage;

  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _bmiController = TextEditingController();
  final _systolicBpController = TextEditingController();
  final _diastolicBpController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _insulinController = TextEditingController();
  final _triglyceridesController = TextEditingController();
  final _hscrpController = TextEditingController();
  final _totalCholesterolController = TextEditingController();
  final _hdlCholesterolController = TextEditingController();
  final _smokingController = TextEditingController();
  final _activityController = TextEditingController();

  void _handleAnalyze() {
    final patientData = {
      'RIDAGEYR': double.tryParse(_ageController.text),
      'DMDHRGND': double.tryParse(_genderController.text),
      'BMXBMI': double.tryParse(_bmiController.text),
      'BPXSY1': double.tryParse(_systolicBpController.text),
      'BPXDI1': double.tryParse(_diastolicBpController.text),
      'LBXGLU': double.tryParse(_glucoseController.text),
      'LBXIN': double.tryParse(_insulinController.text),
      'LBXTR': double.tryParse(_triglyceridesController.text),
      'LBXHSCRP': double.tryParse(_hscrpController.text),
      'LBXTC': double.tryParse(_totalCholesterolController.text),
      'LBDHDD': double.tryParse(_hdlCholesterolController.text),
      'SMQ020': double.tryParse(_smokingController.text),
      'PAQ650': double.tryParse(_activityController.text),
    };
    
    patientData.removeWhere((key, value) => value == null);

    _getPrediction(patientData);
  }

  Future<void> _getPrediction(Map<String, dynamic> patientData) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _apiResponse = null;
    });

    try {
      final response = await ApiService.predictDiabetes(patientData);
      setState(() {
        _apiResponse = response;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Error connecting to AI model: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _genderController.dispose();
    _bmiController.dispose();
    _systolicBpController.dispose();
    _diastolicBpController.dispose();
    _glucoseController.dispose();
    _insulinController.dispose();
    _triglyceridesController.dispose();
    _hscrpController.dispose();
    _totalCholesterolController.dispose();
    _hdlCholesterolController.dispose();
    _smokingController.dispose();
    _activityController.dispose();
    super.dispose();
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
              
              DiabetesInputCard(
                isLoading: _isLoading,
                onAnalyze: _handleAnalyze,
                ageController: _ageController,
                genderController: _genderController,
                bmiController: _bmiController,
                systolicBpController: _systolicBpController,
                diastolicBpController: _diastolicBpController,
                glucoseController: _glucoseController,
                insulinController: _insulinController,
                triglyceridesController: _triglyceridesController,
                hscrpController: _hscrpController,
                totalCholesterolController: _totalCholesterolController,
                hdlCholesterolController: _hdlCholesterolController,
                smokingController: _smokingController,
                activityController: _activityController,
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const Center(child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                )),
              if (_errorMessage != null)
                Center(child: Text(_errorMessage!, style: const TextStyle(color: Colors.red))),
              if (_apiResponse != null)
                AnalysisResultsCard(response: _apiResponse!),
            ],
          ),
        ),
      ),
    );
  }
}