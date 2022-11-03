import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TelechargerOrdonnance extends StatefulWidget {
  DocumentSnapshot docid;
  TelechargerOrdonnance({required this.docid});
  @override
  State<TelechargerOrdonnance> createState() =>
      _TelechargerOrdonnanceState(docid: docid);
}

class _TelechargerOrdonnanceState extends State<TelechargerOrdonnance> {
  DocumentSnapshot docid;
  _TelechargerOrdonnanceState({required this.docid});
  final pdf = pw.Document();
  var designation;
  var posologie;
  var DureeCure;
  //var subject3;

  // var marks;
  void initState() {
    setState(() {
      designation = widget.docid.get('designation');
      posologie = widget.docid.get('posologie');
      DureeCure = widget.docid.get('nbreJours');
      // subject3 = widget.docid.get('History');

      // marks = int.parse(posologie) + int.parse(DureeCure) + int.parse(subject3);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      // maxPageWidth: 1000,
      // useActions: false,
      // canChangePageFormat: true,
      canChangeOrientation: false,
      // pageFormats:pageformat,
      canDebug: false,

      build: (format) => generateDocument(
        format,
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();
    // final image = await imageFromAssetBundle('assets/r2.svg');

    //String? _logo = await rootBundle.loadString('assets/r2.svg');

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Center(
              child: pw.Column(
            //mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              /*pw.Flexible(
                    child: pw.SvgImage(
                      svg: _logo,
                      height: 100,
                    ),
                  ),*/
             pw.SizedBox(
                height: 20,
              ),
              pw.Center(
                child: pw.Text(
                  'E-Diab Health Care',
                  style: pw.TextStyle(
                    fontSize: 50,
                    fontWeight: pw.FontWeight.bold,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Center(
                child: pw.Text(
                  'Ordonnance médicale',
                  style: pw.TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Désignation : ',
                    style: pw.TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  pw.Text(
                    designation,
                    style: pw.TextStyle(
                      fontSize: 30,

                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Posologie : ',
                    style: pw.TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  pw.Text(
                    posologie,
                    style: pw.TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Duree de la cure : ',
                    style: pw.TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  pw.Text(
                    DureeCure + ' ' + 'jours',
                    style: pw.TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              /* pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'History : ',
                        style: pw.TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      pw.Text(
                        subject3,
                        style: pw.TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),*/
             // pw.Divider(),
              /*  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'Total : ',
                        style: pw.TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      pw.Text(
                        marks.toString(),
                        style: pw.TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),*/
            ],
          ));
        },
      ),
    );

    return doc.save();
  }
}
