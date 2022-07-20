import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
import 'package:kied/model/order_item.dart';
import 'package:kied/services/sidmenu_controller.dart';

import '../../../logic/pdf_maker.dart';
import '../../../model/invoice.dart';
import '../../services/health_check_controller.dart';

class HealthChecker extends StatelessWidget {
  HealthChecker({
    Key? key,
  }) : super(key: key);
  // InvoiceData invoiceModel = InvoiceData();
  final TextEditingController capEmplyed = TextEditingController(),
      shareHolderEquity = TextEditingController(),
      presntVal = TextEditingController();
  final TextEditingController pastVal = TextEditingController(),
      interestExpense = TextEditingController(),
      totalLiability = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HealthController hc = Get.put(HealthController());
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
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: formqstn(
                            data: 'Total Revenue',
                            hint: 'Total Revenue',
                            onchanged: (text) {
                              hc.editTotalRevueue(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Total Expense',
                            hint: 'Total Expense',
                            onchanged: (text) {
                              hc.editTotalExpense(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Taxes',
                            hint: 'Taxes',
                            onchanged: (text) {
                              hc.editTax(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Interest',
                            hint: 'Interest',
                            onchanged: (text) {
                              hc.editInterest(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Interest Expense',
                            hint: 'Interest Expense',
                            onchanged: (text) {
                              hc.editInterestExpense(
                                  double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: formqstn(
                            data: 'Total Assets',
                            hint: 'Total Assets',
                            onchanged: (text) {
                              hc.editTotalAssets(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Total Liability',
                            hint: 'Total Liability',
                            onchanged: (text) {
                              hc.editTotalLiability(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Current Employed',
                            hint: 'Current Employed',
                            onchanged: (text) {
                              hc.editCurrentEmployed(
                                  double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Past Value',
                            hint: 'Past Value',
                            onchanged: (text) {
                              hc.editPastVal(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Present Value',
                            hint: 'Present Value',
                            onchanged: (text) {
                              hc.editPresentVal(double.tryParse(text) ?? 0);
                            },
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Column(
                        children: [
                          MetricRow(
                              val: hc.roce, name: 'Return on Capital Employed'),
                          MetricRow(val: hc.roe, name: 'Return on Equity'),
                          MetricRow(
                              val: hc.profitGrowth, name: 'Profit Growth'),
                          MetricRow(
                              val: hc.intrestCourageRatio,
                              name: 'Interest Coverage Ratio'),
                          MetricRow(
                              val: hc.debtEqtRatio,
                              name: 'Debt to Equity Ratio'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Health of the company ',
                                  style: TextStyle(
                                    color: Color(0xff14D19D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  hc.health < 1
                                      ? "Very Bad"
                                      : hc.health < 3
                                          ? "Bad"
                                          : hc.health < 5
                                              ? "Average"
                                              : hc.health < 7
                                                  ? "Above Average"
                                                  : hc.health < 9
                                                      ? "Good"
                                                      : "Excellent",
                                  style: TextStyle(
                                    color: hc.health < 1
                                        ? Colors.red
                                        : hc.health < 3
                                            ? Colors.orange[900]
                                            : hc.health < 5
                                                ? Color.fromARGB(
                                                    255, 181, 109, 0)
                                                : hc.health < 7
                                                    ? Color.fromARGB(
                                                        255, 169, 154, 17)
                                                    : hc.health < 9
                                                        ? Color.fromARGB(
                                                            255, 102, 145, 53)
                                                        : Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MetricRow extends StatelessWidget {
  const MetricRow({Key? key, required this.val, required this.name})
      : super(key: key);

  final RxDouble val;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xff14D19D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(() => Text(val.toString()))
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expected $name',
                style: const TextStyle(
                  color: Color(0xff14D19D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('34 %')
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: const TextStyle(
                  color: Color(0xff14D19D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              val > 34
                  ? Text(
                      "Good",
                      style: const TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      "Bad",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 209, 52, 20),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
            ],
          )),
        ],
      ),
    );
  }
}
