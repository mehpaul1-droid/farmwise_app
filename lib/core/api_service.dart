import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class ApiService {

  static Future<Map<String, dynamic>> getProfit() async {
    final res = await http.get(
      Uri.parse("${ApiConfig.baseUrl}/analytics/profit"),
    );

    return jsonDecode(res.body);
  }

}
