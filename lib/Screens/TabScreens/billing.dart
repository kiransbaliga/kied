import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
import 'package:kied/model/order_item.dart';
import 'package:kied/services/order_page_controller.dart';
import 'package:kied/services/sidmenu_controller.dart';

import '../../logic/pdf_maker.dart';
import '../../model/invoice.dart';
import 'order_page.dart';

class Billing extends StatelessWidget {
  const Billing({
    Key? key,
  }) : super(key: key);
  // InvoiceData invoiceModel = InvoiceData();
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    OrderController oc = Get.put(OrderController());
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(69, 224, 224, 254),
        ),
        // child: SingleChildScrollView(
        //   child: SizedBox(
        //     height: MediaQuery.of(context).size.height * 2,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Row(
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
                      SizedBox(
                        height: 20,
                      ),
                      formqstn(
                        data: 'Customer Address',
                        hint: 'Enter Address',
                        onchanged: (text) {
                          c.invoicedata.value.receiverAddress = text;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      formqstn(
                        data: 'Business Name',
                        hint: 'Business name',
                        onchanged: (text) {
                          c.invoicedata.value.receiverName = text;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      formqstn(
                        data: 'Business Address',
                        hint: 'Business Address',
                        onchanged: (text) {
                          c.invoicedata.value.receiverAddress = text;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //     width: 250,
                      //     child: Row(
                      //       children: [
                      //         const Expanded(
                      //           child: Text(
                      //             'Order',
                      //             style: TextStyle(
                      //               color: Color(0xff14D19D),
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: ElevatedButton(
                      //             child: const Text('Edit Order'),
                      //             onPressed: () async {
                      //               c.count.value = 4;
                      //             },
                      //           ),
                      //         )
                      //       ],
                      //     )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      formqstn(
                        data: 'Bill Number',
                        hint: '#bill',
                        onchanged: (text) {
                          c.invoicedata.value.invoiceNo = text;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      formqstn(
                        data: 'Bill Date',
                        hint: 'dd-mm-yyyy',
                        onchanged: (text) {
                          c.invoicedata.value.issueDate =
                              DateTime.tryParse(text) ?? DateTime(2022);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      formqstn(
                        data: 'Customer Note',
                        hint: 'Thank you for your business',
                        onchanged: (text) {
                          c.invoicedata.value.note = text;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: formqstn(
                      data: 'Order Number',
                      hint: 'Order Number',
                      onchanged: (text) {
                        c.invoicedata.value.orderNo = text;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          Color(0xff14D19D),
                        )),
                        child: const Text('Add Order'),
                        onPressed: () async {
                          oc.add();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Item',
                      style: TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Rate',
                      style: TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Price',
                      style: TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => Column(children: [
                  for (int ind = 0; ind < oc.items.length; ind++)
                    FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Item',
                                ),
                                onChanged: (text) {
                                  oc.editName(text, ind);
                                },
                                // controller: TextEditingController(
                                //     text: oc.items.length > ind
                                //         ? oc.items[ind].name
                                //         : ''),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Quantity',
                                ),
                                onChanged: (text) {
                                  oc.editQuantity(
                                      double.tryParse(text) ?? 0, ind);
                                },
                                // controller: TextEditingController(
                                //     text: oc.items.length > ind
                                //         ? oc.items[ind].quantity.toString()
                                //         : '')
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Rate',
                                ),
                                onChanged: (text) {
                                  oc.editRate(double.tryParse(text) ?? 0, ind);
                                },
                                // controller: TextEditingController(
                                //     text: oc.items.length > ind
                                //         ? oc.items[ind].rate.toString()
                                //         : ''),
                              ),
                            ),
                            Expanded(
                              child: Obx(
                                () => Text('${oc.items[ind].price}'),
                              ),
                            ),
                          ],
                        )),
                ]
                    // },
                    )),
            Obx(
              () => oc.items.isEmpty
                  ? Center(
                      child: Text(
                        'No Items',
                      ),
                    )
                  : Container(),
            ),
            SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price without Tax',
                        style: const TextStyle(
                          color: Color(0xff14D19D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(
                        () => Text('${oc.totalprice.value}'),
                      ),
                    ],
                  )),
                  Expanded(
                    child: formqstn(
                      data: 'Tax Percent',
                      hint: 'Enter Tax Percent',
                      onchanged: (text) {
                        oc.editTax(double.tryParse(text) ?? 0);
                      },
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                          color: const Color(0xff14D19D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(
                        () => Text(
                            '${oc.totalprice.value * ((100 + (oc.taxr.value)) / 100)}'),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
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
                    c.invoicedata.value.edit(
                        orderNo: c.invoicedata.value.orderNo,
                        orders: oc.items.toList(),
                        taxPercent: oc.taxr.value,
                        amount: oc.totalprice.value);
                    c.invoicedata.value.isInvoice = false;
                    File f =
                        await PDFMaker.makeCustomInvoice(c.invoicedata.value);
                    c.setDocument(f);
                    c.set(5);
                  },
                ),
              ),
            )
            // ElevatedButton(
            //     onPressed: () {
            //       c.invoicedata.value.edit(
            //           orderNo: c.invoicedata.value.orderNo,
            //           orders: oc.items.toList(),
            //           taxPercent: oc.taxr.value,
            //           amount: oc.totalprice.value);
            //       c.count.value = 0;
            //     },
            //     child: const Text('Add Order'))
            ,
            SizedBox(height: 25),
          ],
        ),
        //   ),
        // ),
      ),
    );
  }
}
