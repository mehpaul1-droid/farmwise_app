class AIPredictionResult {
  final double predictedWeightGain;
  final double predictedEggProduction;
  final String healthStatus;
  final List<String> insights;
  final double riskScore;

  AIPredictionResult({
    required this.predictedWeightGain,
    required this.predictedEggProduction,
    required this.healthStatus,
    required this.insights,
    required this.riskScore,
  });
}