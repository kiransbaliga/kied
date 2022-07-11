import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
import 'package:kied/model/order_item.dart';
import 'package:kied/services/sidmenu_controller.dart';

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
              PDFViewer(document: c.document.value),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        c.set(1);
                      },
                      child: Text('Share')),
                  ElevatedButton(
                      onPressed: () {
                        c.set(1);
                      },
                      child: Text('Exit')),
                ],
              )
            ],
          )),
    );
  }
}
