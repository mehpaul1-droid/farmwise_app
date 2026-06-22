import 'dart:convert';
import 'package:http/http.dart' as http;

class PdfApi {

  static const base =
      "https://farmwiseonlinebackend-production.up.railway.app";

  static Future<Map<String, dynamic>> getReport() async {

    final res = await http.get(
      Uri.parse("$base/pdf/report"),
    );

    return jsonDecode(res.body);
  }
}
