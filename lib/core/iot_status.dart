class IoTStatus {
  static bool connected = false;

  static void connect() {
    connected = true;
  }

  static void disconnect() {
    connected = false;
  }
}
