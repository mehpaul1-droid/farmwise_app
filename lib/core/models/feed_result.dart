class FeedResult {
  final double protein;
  final double energy;
  final double fiber;
  final List<String> warnings;

  FeedResult({
    required this.protein,
    required this.energy,
    required this.fiber,
    required this.warnings,
  });
}