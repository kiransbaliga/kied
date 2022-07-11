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
  Invoice({
    Key? key,
  }) : super(key: key);
  InvoiceData invoiceModel = InvoiceData();
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(69, 224, 224, 254),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 43,
                ),
                Image(
                  width: 800,
                  image: AssetImage('assets/images/invoice-banner.png'),
                ),
              ],
            ),
            SizedBox(
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
                            invoiceModel.receiverName = text;
                          },
                        ),
                        formqstn(
                          data: 'Customer Address',
                          hint: 'Enter Address',
                          onchanged: (text) {
                            invoiceModel.receiverAddress = text;
                          },
                        ),
                        formqstn(
                          data: 'Business Name',
                          hint: 'Business name',
                          onchanged: (text) {
                            invoiceModel.receiverName = text;
                          },
                        ),
                        formqstn(
                          data: 'Business Address',
                          hint: 'Business Address',
                          onchanged: (text) {
                            invoiceModel.receiverAddress = text;
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text('Order'),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                child: Text('Edit Order'),
                                onPressed: () async {
                                  InvoiceData id =
                                      await Get.to<InvoiceData>(OrderPage()) ??
                                          invoiceModel;
                                },
                              ),
                            )
                          ],
                        )
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
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Invoice Date',
                          hint: 'dd-mm-yyyy',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Due Date',
                          hint: 'dd-mm-yyyy',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Customer Note',
                          hint: 'Thank you for your business',
                          onchanged: (text) {},
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xff14D19D)),
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
                              title: Text(
                                'Generate PDF',
                                style: TextStyle(
                                  color: Color(0xff14D19D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Icon(
                                Icons.document_scanner,
                                color: Color(0xff14D19D),
                              ),
                              onTap: () async {
                                File f = await PDFMaker.makeCustomInvoice(
                                    invoiceModel);
                                c.setDocument(await PDFDocument.fromFile(f));
                                c.set(5);
                              },
                            ),
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
