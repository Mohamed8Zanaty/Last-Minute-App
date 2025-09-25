// lib/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

// IMPORTANT FOR YOUR FRIEND:
// They must replace this IP address with the one their computer uses.
// If running the Flutter app on an Android Emulator, use '10.0.2.2'.
// If running on a physical phone, find the computer's local IP address (like '192.168.1.10').
const String _apiUrl = 'http://10.0.2.2:8000/predict';

// This is a data structure for the response from the AI
class ApiResponse {
  final double probability;
  final String severity;
  final List<String> explanationText;
  final String shapPlotBase64;

  ApiResponse({
    required this.probability,
    required this.severity,
    required this.explanationText,
    required this.shapPlotBase64,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      probability: json['probability'],
      severity: json['severity'],
      explanationText: List<String>.from(json['explanation_text']),
      shapPlotBase64: json['shap_plot_base64'],
    );
  }
}

class ApiService {
  static Future<ApiResponse> predictDiabetes(Map<String, dynamic> patientData) async {
    final uri = Uri.parse(_apiUrl);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(patientData),
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get prediction. Status code: ${response.statusCode}');
    }
  }
}