import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
import 'package:kied/model/order_item.dart';
import 'package:kied/services/sidmenu_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../logic/pdf_maker.dart';
import '../../model/invoice.dart';
import 'order_page.dart';

class ShowPdfPage extends StatelessWidget {
  ShowPdfPage({
    Key? key,
    // required this.invoiceModel
  }) : super(key: key);
  // InvoiceData invoiceModel ;
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();

    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(69, 224, 224, 254),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Generated PDF',
                      style: TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Share.shareFiles([c.document.value.path],
                              subject:
                                  'Invoice from ${c.invoicedata.value.companyName}',
                              text:
                                  'Here is the invoice(Invoice #${c.invoicedata.value.invoiceNo}) to ${c.invoicedata.value.receiverName}, ${c.invoicedata.value.receiverAddress} for the Order Number ${c.invoicedata.value.orderNo} costing Rs ${c.invoicedata.value.amount}.');
                        },
                        child: Text('Share')),
                    ElevatedButton(
                        onPressed: () {
                          c.set(1);
                        },
                        child: Text('Exit')),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: FutureBuilder<PDFDocument>(
                      future: PDFDocument.fromFile(c.document.value),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return PDFViewer(
                            document: snap.data!,
                          );
                        } else if (snap.hasError) {
                          return Text(
                            'Error: ${snap.error}',
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            ],
          )),
    );
  }
}
