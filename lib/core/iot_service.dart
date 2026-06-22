class IoTService {

  static Map<int, bool> farmConnections = {};

  static void initFarm(int farmId) {
    farmConnections[farmId] = false;
  }

  static bool isConnected(int farmId) {
    return farmConnections[farmId] ?? false;
  }

  static void connect(int farmId) {
    farmConnections[farmId] = true;
  }

  static void disconnect(int farmId) {
    farmConnections[farmId] = false;
  }
}
