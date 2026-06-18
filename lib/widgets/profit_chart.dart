import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProfitChart extends StatelessWidget {
  const ProfitChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),

          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 3),
                FlSpot(2, 2.5),
                FlSpot(3, 5),
                FlSpot(4, 4),
                FlSpot(5, 6),
                FlSpot(6, 7),
              ],
              isCurved: true,
              barWidth: 3,
              color: Colors.greenAccent,
              dotData: const FlDotData(show: false),
            )
          ],
        ),
      ),
    );
  }
}
