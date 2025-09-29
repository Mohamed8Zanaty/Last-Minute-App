
class ApiResponse {
  final int prediction; 
  final double probability;
  final String severity;
  final List<String> explanationText;
  final String? shapPlotBytes;

  ApiResponse({
    required this.prediction, 
    required this.probability,
    required this.severity,
    required this.explanationText,
    this.shapPlotBytes,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      prediction: (json['prediction'] as num?)?.toInt() ?? 0, 
      probability: (json['probability'] as num?)?.toDouble() ?? 0.0,
      severity: json['severity'] ?? 'N/A',
      explanationText: List<String>.from(json['explanation_text'] ?? []),
      shapPlotBytes: json['shap_plot_bytes'],
    );
  }
}

