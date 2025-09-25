// lib/ai_health_check_screen.dart

import 'package:flutter/material.dart';
import 'api_service.dart';
import 'diabetes_input_card.dart';
import 'analysis_results_card.dart';
import 'ai_topbar.dart'; // We are reusing your top bar

class AiHealthCheckPage extends StatefulWidget {
  const AiHealthCheckPage({super.key});

  @override
  State<AiHealthCheckPage> createState() => _AiHealthCheckPageState();
}

class _AiHealthCheckPageState extends State<AiHealthCheckPage> {
  // State variables to manage the API connection
  bool _isLoading = false;
  ApiResponse? _apiResponse;
  String? _errorMessage;

  // This function is called when the user clicks "Analyze"
  Future<void> _getPrediction(Map<String, dynamic> patientData) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _apiResponse = null; // Clear previous results
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(), // Your existing TopBar
              const SizedBox(height: 20),
              
              // This is the new input form
              DiabetesInputCard(
                isLoading: _isLoading,
                onAnalyzeClick: (patientData) {
                  _getPrediction(patientData);
                },
              ),
              const SizedBox(height: 20),

              // This section shows the results from the AI model
              if (_isLoading)
                const Center(child: CircularProgressIndicator()),
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