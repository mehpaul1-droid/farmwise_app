class Farm {
  final String name;
  final double income;
  final double cost;

  Farm({
    required this.name,
    required this.income,
    required this.cost,
  });

  double get profit => income - cost;
}
