import '../models/farm.dart';

class FarmService {

  static List<Farm> farms = [
    Farm(
      id: "1",
      name: "گاوداری مرکزی",
      category: FarmCategory.livestock,
      type: "گاو",
      animalCount: 120,
    ),
    Farm(
      id: "2",
      name: "گوسفندداری",
      category: FarmCategory.livestock,
      type: "گوسفند",
      animalCount: 300,
    ),
    Farm(
      id: "3",
      name: "مرغداری صنعتی",
      category: FarmCategory.poultry,
      type: "مرغ",
      animalCount: 5000,
    ),
  ];

  static List<Farm> getAllFarms() => farms;

  static List<Farm> getLivestock() =>
      farms.where((f) => f.category == FarmCategory.livestock).toList();

  static List<Farm> getPoultry() =>
      farms.where((f) => f.category == FarmCategory.poultry).toList();
}
