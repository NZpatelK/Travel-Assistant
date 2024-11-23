import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:markdown/markdown.dart' as md;

/// Converts Markdown content to plain text via HTML parsing
String convertMarkdownToPlainText(String markdownContent) {
  // Convert Markdown to HTML
  final htmlContent = md.markdownToHtml(markdownContent);
  // Parse HTML to extract plain text
  final document = html_parser.parse(htmlContent);
  return document.body?.text ?? '';
}

/// Generates a PDF from plain text and saves it to a file
Future<String> createPdf(String plainTextContent, String fileName) async {
  final pdf = pw.Document();

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Header(level: 0, text: 'Markdown to PDF Example'),
          pw.Text(plainTextContent, style: const pw.TextStyle(fontSize: 14)),
        ],
      ),
    ),
  );

  // Save the PDF file
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName.pdf';
  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());
  return filePath;
}

/// Combines Markdown-to-PlainText conversion and PDF creation
Future<String> generatePdfFromMarkdown(String markdownContent, String fileName) async {
  // Step 1: Convert Markdown to plain text
  final plainTextContent = convertMarkdownToPlainText(markdownContent);

  // Step 2: Generate PDF from the plain text
  final pdfPath = await createPdf(plainTextContent, fileName);

  return pdfPath;
}




//                   ElevatedButton(
//                     onPressed: () async {
//                       const markdownContent = """
// # Hello World
// This is **Markdown** content converted to a **PDF**.

// - Item 1
// - Item 2
// - Item 3

// Visit [Flutter](https://flutter.dev).
// """;

//                       try {
//                         final pdfPath = await generatePdfFromMarkdown(
//                             markdownContent, "example_markdown");
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('PDF saved at: $pdfPath')),
//                         );
//                         // Open the PDF
//                         await OpenFilex.open(pdfPath);
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Error: $e')),
//                         );
//                       }
//                     },
//                     child: Text('Generate PDF'),
//                   ),