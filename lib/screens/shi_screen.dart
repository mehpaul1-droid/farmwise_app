import 'package:flutter/material.dart';
import '../services/shi_calculator.dart';

class SHIScreen extends StatefulWidget {
  const SHIScreen({super.key});

  @override
  State<SHIScreen> createState() => _SHIScreenState();
}

class _SHIScreenState extends State<SHIScreen> {

  double income = 1000000;
  double cost = 600000;
  double shiPercent = 20;

  @override
  Widget build(BuildContext context) {

    double costAfterSHI =
        SHICalculator.replaceProtein(cost, shiPercent);

    double profit =
        SHICalculator.calculateProfit(income, costAfterSHI);

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("SHI Feed System"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text(
              "سیستم جایگزینی SHI در خوراک",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text("درصد SHI: $shiPercent%",
                style: const TextStyle(color: Colors.white)),

            Slider(
              value: shiPercent,
              min: 0,
              max: 60,
              onChanged: (v) {
                setState(() {
                  shiPercent = v;
                });
              },
            ),

            const SizedBox(height: 20),

            Text("هزینه قبل: $cost",
                style: const TextStyle(color: Colors.white)),
            Text("هزینه بعد SHI: $costAfterSHI",
                style: const TextStyle(color: Colors.greenAccent)),

            const SizedBox(height: 20),

            Text("سود نهایی: $profit",
                style: const TextStyle(
                    color: Colors.yellow, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
