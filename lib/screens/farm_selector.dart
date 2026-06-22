import 'package:flutter/material.dart';

class FarmSelector extends StatefulWidget {
  const FarmSelector({super.key});

  @override
  State<FarmSelector> createState() => _FarmSelectorState();
}

class _FarmSelectorState extends State<FarmSelector> {

  int selectedFarm = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _btn("Farm 1", 1),
          _btn("Farm 2", 2),
          _btn("Farm 3", 3),
        ],
      ),
    );
  }

  Widget _btn(String title, int id) {
    return ElevatedButton(
      onPressed: () {
        setState(() => selectedFarm = id);
      },
      child: Text(title),
    );
  }
}
