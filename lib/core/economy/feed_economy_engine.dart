class FeedCostResult {
  final double cost;
  final double efficiency;

  FeedCostResult(this.cost, this.efficiency);
}

class FeedEconomyEngine {
  FeedCostResult calculate(int animalCount) {
    double cost = animalCount * 10.0;
    double efficiency = animalCount * 1.5;

    return FeedCostResult(cost, efficiency);
  }
}