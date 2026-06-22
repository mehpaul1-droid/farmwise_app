import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../core/api_service.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({super.key});

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  List<double> profits = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final data = await ApiService.getProfit();
    setState(() {
      profits = List<double>.from(data["profit"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: profits
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),
          )
        ],
      ),
    );
  }
}
