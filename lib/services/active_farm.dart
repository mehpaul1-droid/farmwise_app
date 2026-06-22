import '../models/farm.dart';

class ActiveFarm {
  static Farm? currentFarm;

  static void setFarm(Farm farm) {
    currentFarm = farm;
  }

  static Farm? getFarm() {
    return currentFarm;
  }
}
