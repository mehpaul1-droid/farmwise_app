import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/analytics_api.dart';

class ProfitAdvancedChart extends StatefulWidget {
  const ProfitAdvancedChart({super.key});

  @override
  State<ProfitAdvancedChart> createState() => _ProfitAdvancedChartState();
}

class _ProfitAdvancedChartState extends State<ProfitAdvancedChart> {
  Map<String, dynamic>? data;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      final res = await AnalyticsApi.getProfitData();

      setState(() {
        data = res;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    final revenue = List<double>.from(data?["revenue"] ?? []);
    final cost = List<double>.from(data?["cost"] ?? []);
    final profit = List<double>.from(data?["profit"] ?? []);

    return Card(
      color: const Color(0xFF111C33),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 260,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),

              lineBarsData: [

                LineChartBarData(
                  spots: revenue.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value);
                  }).toList(),
                  isCurved: true,
                  color: Colors.greenAccent,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),

                LineChartBarData(
                  spots: cost.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value);
                  }).toList(),
                  isCurved: true,
                  color: Colors.redAccent,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),

                LineChartBarData(
                  spots: profit.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value);
                  }).toList(),
                  isCurved: true,
                  color: Colors.blueAccent,
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
