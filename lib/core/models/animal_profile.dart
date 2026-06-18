import 'livestock_type.dart';

class AnimalProfile {
  final LivestockType type;
  final int count;
  final double avgWeight;
  final int ageDays;

  AnimalProfile({
    required this.type,
    required this.count,
    required this.avgWeight,
    required this.ageDays,
  });
}