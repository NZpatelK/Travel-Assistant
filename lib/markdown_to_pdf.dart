import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:markdown/markdown.dart' as md;


Future<String> generateMarkdownStyledPdf(String markdownContent, String fileName) async {
  final pdf = pw.Document();

  // Parse the Markdown into widgets
  final widgets = parseMarkdownToPdfWidgets(markdownContent);

  // Add the parsed widgets to the PDF
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(20),
      build: (context) => widgets,
    ),
  );

  // Save the PDF file
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName.pdf';
  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());
  return filePath;
}

/// Converts Markdown content into a list of styled PDF widgets
List<pw.Widget> parseMarkdownToPdfWidgets(String markdownContent) {
  final elements = md.markdownToHtml(markdownContent);
  final parsedHtml = html_parser.parse(elements);

  List<pw.Widget> widgets = [];

  for (var element in parsedHtml.body!.children) {
    switch (element.localName) {
      case 'h1': // Header 1
        widgets.add(
          pw.Header(
            level: 0,
            text: element.text,
            textStyle: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
          ),
        );
        break;
      case 'h2': // Header 2
        widgets.add(
          pw.Header(
            level: 1,
            text: element.text,
            textStyle: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
        );
        break;
      case 'h3': // Header 3
        widgets.add(
          pw.Header(
            level: 2,
            text: element.text,
            textStyle: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
        );
        break;
      case 'p': // Paragraph
        if (element.text.trim() == '---') {
          // Add a horizontal rule for "---"
          widgets.add(
            pw.Divider(thickness: 1, color: PdfColors.grey),
          );
        } else {
          widgets.add(
            pw.Text(
              element.text,
              style: const pw.TextStyle(fontSize: 14),
            ),
          );
        }
        break;
      case 'ul': // Unordered list
        final listItems = element.children
            .where((child) => child.localName == 'li')
            .map((li) => pw.Bullet(text: li.text))
            .toList();
        widgets.addAll(listItems);
        break;
      case 'a': // Hyperlinks
        widgets.add(
          pw.Text(
            element.text,
            style: const pw.TextStyle(
              fontSize: 14,
              decoration: pw.TextDecoration.underline,
              color: PdfColors.blue,
            ),
          ),
        );
        break;
      default:
        widgets.add(
          pw.Text(
            element.text,
            style: const pw.TextStyle(fontSize: 14),
          ),
        );
        break;
    }
  }

  return widgets;
}
