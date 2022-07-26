import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
import 'package:kied/model/expense.dart';
import 'package:kied/model/invoice_for_hive.dart';
import 'package:kied/model/order_item.dart';
import 'package:kied/services/invoice_list_controller.dart';
import 'package:kied/services/order_page_controller.dart';
import 'package:kied/services/sidmenu_controller.dart';

import '../../logic/pdf_maker.dart';
import '../../model/invoice.dart';
import 'order_page.dart';

class InvoiceListScreen extends StatelessWidget {
  InvoiceListScreen({
    Key? key,
  }) : super(key: key);

  getinfo() {
    Box invoicebox = Hive.box<InvoiceHiveModel>('invoices');
    ic.clear();
    for (String ke in invoicebox.keys) {
      ic.add(invoicebox.get(ke));
    }
    Box expensebox = Hive.box<ExpenseData>('expenses');

    for (String ke in expensebox.keys) {
      ic.addexp(expensebox.get(ke));
    }
  }

  // InvoiceData invoiceModel = InvoiceData();
  List<InvoiceHiveModel> invoices = [];
  InvoiceListController ic = Get.put(InvoiceListController());
  @override
  Widget build(BuildContext context) {
    getinfo();
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(69, 224, 224, 254),
        ),
        // child: SingleChildScrollView(
        //   child: SizedBox(
        //     height: MediaQuery.of(context).size.height * 2,
        child: Column(
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
                  image: AssetImage('assets/images/expenses-banner.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20)),
                        child: TabBar(
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff14D19D),
                            ),
                            labelColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 20),
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                text: "Income",
                              ),
                              Tab(
                                text: "Expenses",
                              )
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Obx(() {
                              return ListView.builder(
                                  itemCount: ic.invoices.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: Chip(
                                            label: ic.invoices.value[index]
                                                    .isInvoice
                                                ? Text('Invoice')
                                                : Text('   Bill   '),
                                          ),
                                          title: Text(
                                            'Receiver: ${ic.invoices.value[index].receiverName}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            '#${ic.invoices.value[index].invoiceNo}',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          trailing: Text(
                                            'Rs ${ic.invoices.value[index].getTotalAmount.toStringAsFixed(2)}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ));
                            }),
                            Obx(() {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: const Color(0xff14D19D)),
                                      ),
                                      // ),
                                      child: ListTile(
                                        title: const Text(
                                          'Add an Expense',
                                          style: TextStyle(
                                            color: Color(0xff14D19D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        trailing: const Icon(
                                          Icons.attach_money,
                                          color: Color(0xff14D19D),
                                        ),
                                        onTap: () async {
                                          ExpenseData exp = ExpenseData();
                                          await showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: SingleChildScrollView(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    18.0),
                                                            child: Text(
                                                              'Add Expense',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff14D19D),
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          formqstn(
                                                              data:
                                                                  'Receiver Name',
                                                              hint: 'To',
                                                              onchanged:
                                                                  (text) {
                                                                exp.paidTo =
                                                                    text;
                                                              }),
                                                          formqstn(
                                                              data:
                                                                  'Payment Description',
                                                              hint: 'For',
                                                              onchanged:
                                                                  (text) {
                                                                exp.description =
                                                                    text;
                                                              }),
                                                          formqstn(
                                                              data: 'Amount',
                                                              hint: 'Worth',
                                                              onchanged:
                                                                  (text) {
                                                                exp.amount =
                                                                    double.tryParse(
                                                                            text) ??
                                                                        0;
                                                              }),
                                                          formqstn(
                                                              data:
                                                                  'Method of Payment',
                                                              hint: 'Via',
                                                              onchanged:
                                                                  (text) {
                                                                exp.methodOfPayment =
                                                                    text;
                                                              }),
                                                          formqstn(
                                                              data: 'Date',
                                                              hint: 'When',
                                                              onchanged:
                                                                  (text) {
                                                                exp.date = text;
                                                              }),
                                                          SizedBox(
                                                            width: 250,
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                      backgroundColor:
                                                                          MaterialStateProperty
                                                                              .all(
                                                                Color(
                                                                    0xff14D19D),
                                                              )),
                                                              child: const Text(
                                                                  'Add Order'),
                                                              onPressed:
                                                                  () async {
                                                                Box<ExpenseData>
                                                                    invoiceBox =
                                                                    Hive.box<
                                                                            ExpenseData>(
                                                                        'expenses');
                                                                invoiceBox.put(
                                                                    '${DateTime.now()}',
                                                                    exp);
                                                                ic.addexp(exp);
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )));
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: ic.expenses.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ListTile(
                                                title: Text(
                                                  'Receiver: ${ic.expenses[index].paidTo}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                subtitle: Text(
                                                  '${ic.expenses[index].description}',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                trailing: Text(
                                                  'Rs ${ic.expenses[index].amount.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                            )),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ]),
                  )),
            ),
          ],

          //   ),
          // ),
        ),
      ),
    );
  }
}
