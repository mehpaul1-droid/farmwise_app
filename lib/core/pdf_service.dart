import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportService {
  static Future<pw.Document> generate() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.Text("گزارش سود فارم"),
        ),
      ),
    );

    return pdf;
  }
}
