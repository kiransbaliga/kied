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

class Invoice extends StatelessWidget {
  const Invoice({
    Key? key,
  }) : super(key: key);
  // InvoiceData invoiceModel = InvoiceData();
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(69, 224, 224, 254),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 43,
                ),
                Image(
                  width: 800,
                  image: AssetImage('assets/images/invoice-banner.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        formqstn(
                          data: 'Customer Name',
                          hint: 'Customer name',
                          onchanged: (text) {
                            c.invoicedata.value.receiverName = text;
                          },
                        ),
                        formqstn(
                          data: 'Customer Address',
                          hint: 'Enter Address',
                          onchanged: (text) {
                            c.invoicedata.value.receiverAddress = text;
                          },
                        ),
                        formqstn(
                          data: 'Business Name',
                          hint: 'Business name',
                          onchanged: (text) {
                            c.invoicedata.value.receiverName = text;
                          },
                        ),
                        formqstn(
                          data: 'Business Address',
                          hint: 'Business Address',
                          onchanged: (text) {
                            c.invoicedata.value.receiverAddress = text;
                          },
                        ),
                        Container(
                            width: 250,
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Order',
                                    style: TextStyle(
                                      color: Color(0xff14D19D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    child: const Text('Edit Order'),
                                    onPressed: () async {
                                      c.count.value = 4;
                                    },
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        formqstn(
                          data: 'Invoice Number',
                          hint: '#invoice',
                          onchanged: (text) {
                            c.invoicedata.value.invoiceNo = text;
                          },
                        ),
                        formqstn(
                          data: 'Invoice Date',
                          hint: 'dd-mm-yyyy',
                          onchanged: (text) {
                            c.invoicedata.value.issueDate =
                                DateTime.tryParse(text) ?? DateTime(2022);
                          },
                        ),
                        formqstn(
                          data: 'Due Date',
                          hint: 'dd-mm-yyyy',
                          onchanged: (text) {
                            c.invoicedata.value.dueDate =
                                DateTime.tryParse(text) ?? DateTime(2022);
                          },
                        ),
                        formqstn(
                          data: 'Customer Note',
                          hint: 'Thank you for your business',
                          onchanged: (text) {
                            c.invoicedata.value.note = text;
                          },
                        ),
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xff14D19D)),
                          ),
                          // child: ListTile(
                          //   leading: Text(
                          //     'Upload File',
                          //     style: TextStyle(
                          //       color: Color(0xff14D19D),
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          //   trailing: Icon(
                          //     Icons.upload_rounded,
                          //     color: Color(0xff14D19D),
                          //   ),
                          // ),
                          child: ListTile(
                            title: const Text(
                              'Generate PDF',
                              style: TextStyle(
                                color: Color(0xff14D19D),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.document_scanner,
                              color: Color(0xff14D19D),
                            ),
                            onTap: () async {
                              File f = await PDFMaker.makeCustomInvoice(
                                  c.invoicedata.value);
                              c.setDocument(await PDFDocument.fromFile(f));
                              c.set(5);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
