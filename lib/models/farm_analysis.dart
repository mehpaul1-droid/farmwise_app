class FarmAnalysis {
  final double revenue;
  final double feedCost;
  final double profit;

  final String healthStatus;
  final double riskScore;

  final double predictedWeightGain;
  final double predictedEggProduction;

  FarmAnalysis({
    required this.revenue,
    required this.feedCost,
    required this.profit,
    required this.healthStatus,
    required this.riskScore,
    required this.predictedWeightGain,
    required this.predictedEggProduction,
  });

  factory FarmAnalysis.fromJson(Map<String, dynamic> json) {
    return FarmAnalysis(
      revenue: (json['revenue'] ?? 0).toDouble(),
      feedCost: (json['feedCost'] ?? 0).toDouble(),
      profit: (json['profit'] ?? 0).toDouble(),
      healthStatus: json['healthStatus'] ?? 'unknown',
      riskScore: (json['riskScore'] ?? 0).toDouble(),
      predictedWeightGain: (json['predictedWeightGain'] ?? 0).toDouble(),
      predictedEggProduction: (json['predictedEggProduction'] ?? 0).toDouble(),
    );
  }
}
