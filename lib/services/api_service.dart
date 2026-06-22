
import 'dart:convert';

import 'package:http/http.dart' as http;



class ApiService {



  static const String baseUrl = "https://farmwise-production.up.railway.app";


  static Future<Map<String, dynamic>> getStatus() async {

    final res = await http.get(Uri.parse("$baseUrl/"));

    return jsonDecode(res.body);

  }



  static Future<Map<String, dynamic>> analyzeFeed(Map<String, dynamic> data) async {

    final res = await http.post(

      Uri.parse("$baseUrl/ai/analyze"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode(data),

    );



    return jsonDecode(res.body);

  }

}

