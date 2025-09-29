// lib/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

// if you are using a local server, replace with your machine's IP address
// mine is this 192.168.1.7 so you have to change it to yours if you are running it on a physical phone
// for emulator  use sth like 10.0.0.2 for android
const String _apiUrl = 'http://192.168.1.7:8000/predict';

class ApiResponse {
  final double probability;
  final String severity;
  final List<String> explanationText;
  ApiResponse({
    required this.probability,
    required this.severity,
    required this.explanationText,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      probability: json['probability'] ?? 0.0,
      severity: json['severity'] ?? 'No data',
      explanationText: json['explanation_text'] != null
          ? List<String>.from(json['explanation_text'])
          : [],
    );
  }
}

class ApiService {
  static Future<ApiResponse> predictDiabetes(
    Map<String, dynamic> patientData,
  ) async {
    final uri = Uri.parse(_apiUrl);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(patientData),
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        'Failed to get prediction. Status code: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }
}
