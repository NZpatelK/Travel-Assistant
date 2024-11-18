import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> markdownToPdf(String markdownContent) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text(markdownContent),
      ),
    ),
  );

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/travel_plan.pdf');
  await file.writeAsBytes(await pdf.save());
}
