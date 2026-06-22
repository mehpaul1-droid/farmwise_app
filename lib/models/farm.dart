enum FarmCategory {
  livestock,
  poultry
}

class Farm {
  final String id;
  final String name;
  final FarmCategory category;
  final String type;
  final int animalCount;

  Farm({
    required this.id,
    required this.name,
    required this.category,
    required this.type,
    required this.animalCount,
  });
}
