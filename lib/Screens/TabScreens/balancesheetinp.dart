import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
import 'package:kied/services/sidmenu_controller.dart';

List<double> vals=[0,0,0,0,0,0,0,0];

class BalanceSheetInp extends StatelessWidget {
  const BalanceSheetInp({Key? key}) : super(key: key);

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
                          formqstn(
                            data: 'Fixed Assets',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[0] = double.parse(text);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          formqstn(
                            data: 'CWIP',
                            hint: 'Current work in process',
                            onchanged: (text) {
                              vals[1] = double.parse(text);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          formqstn(
                            data: 'Investments',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[2] = double.parse(text);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          formqstn(
                            data: 'Other Assets',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[3] = double.parse(text);
                            },
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
                          formqstn(
                            data: 'Share capitals',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[4] = double.parse(text);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          formqstn(
                            data: 'Reserves',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[5] = double.parse(text);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          formqstn(
                            data: 'Borrowing',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[6] = double.parse(text);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          formqstn(
                            data: 'Other liabitlities',
                            hint: '\$ amount',
                            onchanged: (text) {
                              vals[7] = double.parse(text);
                            },
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
                    'Proceed',
                    style: TextStyle(
                      color: Color(0xff14D19D),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xff14D19D),
                  ),
                  onTap: () {
                    c.count.value = 8;
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
