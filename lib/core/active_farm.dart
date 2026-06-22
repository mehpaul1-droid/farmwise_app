class ActiveFarm {

  static int currentFarmId = 1;

  static void setFarm(int id) {
    currentFarmId = id;
  }

  static int getFarm() {
    return currentFarmId;
  }
}
