class ProfitResult {
  final double revenue;
  final double feedCost;
  final double otherCosts;
  final double profit;
  final String status;
  final List<String> insights;

  ProfitResult({
    required this.revenue,
    required this.feedCost,
    required this.otherCosts,
    required this.profit,
    required this.status,
    required this.insights,
  });
}