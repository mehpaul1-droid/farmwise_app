import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfitChart extends StatelessWidget {
  const ProfitChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF111C33),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 2),
                    FlSpot(1, 3),
                    FlSpot(2, 2.5),
                    FlSpot(3, 4),
                    FlSpot(4, 5),
                    FlSpot(5, 6),
                    FlSpot(6, 7),
                  ],
                  isCurved: true,
                  color: Colors.greenAccent,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
