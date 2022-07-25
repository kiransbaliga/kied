import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/services/sidmenu_controller.dart';

import 'balancesheetinp.dart';

class BalanceSheetOp extends StatelessWidget {
  const BalanceSheetOp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            Center(
              child: const Text('Balance Sheet Asset',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Center(
                      child: Text("Assets",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                      width: 400,
                      height: 450,
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Fixed Assets", i: 0),
                          SizedBox(
                            height: 30,
                          ),
                          dispform(text: "CWIP", i: 1),
                          SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Investments", i: 2),
                          SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Other Assets", i: 3),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Assets',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFf14d19d),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                '\$ ' + summ(0),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Center(
                      child: Text("Liabilities",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                      width: 400,
                      height: 450,
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Share Capital", i: 4),
                          SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Reservess", i: 5),
                          SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Borrowings", i: 6),
                          SizedBox(
                            height: 30,
                          ),
                          dispform(text: "Other Liabilities", i: 7),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Liabilities',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFf14d19d),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                sum(1),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
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
                    'Return',
                    style: TextStyle(
                      color: Color(0xff14D19D),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff14D19D),
                  ),
                  onTap: () {
                    c.count.value = 0;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String summ(int i) {
  double sm = 0;
  for (int j = 0; j < 4; j++) {
    sm += vals[j];
  }
  return sm.toString();
}

String sum(int k) {
  double sm = 0;
  for (int i = 4; i < 8; i++) {
    sm += vals[i];
  }
  return "\$ " + sm.toString();
}

class dispform extends StatelessWidget {
  int i;
  String text;
  dispform({Key? key, required this.text, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFf14d19d),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          '\$ ${vals[i]}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
