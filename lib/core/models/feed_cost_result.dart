class FeedCostResult {
  final double totalCost;
  final double traditionalCost;
  final double cityProteinCost;
  final bool recommendCityProtein;
  final List<String> insights;

  FeedCostResult({
    required this.totalCost,
    required this.traditionalCost,
    required this.cityProteinCost,
    required this.recommendCityProtein,
    required this.insights,
  });
}