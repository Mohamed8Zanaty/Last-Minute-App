import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> predictDiabetes({
    required int ridageyr,
    required int dmdhrgnd,
    required double bmxbmi,
    required double bpxsy1,
    required double bpxdi1,
    required double lbxglu,
    required double lbxin,
    required double lbxtr,
    required double lbxhscrp,
    required double lbxtc,
    required double lbdhdd,
    required int smq020,
    required int paq650,
  }) async {
    // Replace with your actual API endpoint
    final url = Uri.parse('http://192.168.1.7:8000/predict');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'RIDAGEYR': ridageyr,
          'DMDHRGND': dmdhrgnd,
          'BMXBMI': bmxbmi,
          'BPXSY1': bpxsy1,
          'BPXDI1': bpxdi1,
          'LBXGLU': lbxglu,
          'LBXIN': lbxin,
          'LBXTR': lbxtr,
          'LBXHSCRP': lbxhscrp,
          'LBXTC': lbxtc,
          'LBDHDD': lbdhdd,
          'SMQ020': smq020,
          'PAQ650': paq650,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // Handle server errors
        throw Exception('Failed to get prediction: ${response.body}');
      }
    } catch (e) {
      // Handle network or other errors
      throw Exception('Failed to connect to the service: $e');
    }
  }
}
