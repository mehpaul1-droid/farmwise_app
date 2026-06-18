import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = false;

  Map<String, dynamic>? data;

  Future<void> fetchData() async {
    setState(() => loading = true);

    try {
      final result = await ApiService.analyzeFarm(
        type: "cow",
        count: 10,
      );

      setState(() {
        data = result;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("FarmWise AI Live Dashboard"),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : data == null
              ? const Center(child: Text("No data"))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _card("Profit", data!["totalProfit"].toString()),
                          const SizedBox(width: 10),
                          _card("Feed Cost", data!["feedCost"].toString()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _card("AI Note", data!["aiNote"].toString()),

                      const SizedBox(height: 20),

                      Expanded(
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
                                  FlSpot(3, 4),
                                  FlSpot(4, 3),
                                ],
                                isCurved: true,
                                color: Colors.green,
                                barWidth: 3,
                                dotData: const FlDotData(show: false),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _card(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111C33),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}