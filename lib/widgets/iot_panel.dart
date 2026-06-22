import 'package:flutter/material.dart';
import '../core/iot_service.dart';

class IoTPanel extends StatefulWidget {
  final int farmId;

  const IoTPanel({super.key, required this.farmId});

  @override
  State<IoTPanel> createState() => _IoTPanelState();
}

class _IoTPanelState extends State<IoTPanel> {

  @override
  Widget build(BuildContext context) {
    bool status = IoTService.isConnected(widget.farmId);

    return Card(
      child: ListTile(
        title: Text("IoT Farm ${widget.farmId}"),
        subtitle: Text(status ? "Connected" : "Disconnected"),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              IoTService.connect(widget.farmId);
            });
          },
          child: const Text("Connect"),
        ),
      ),
    );
  }
}
