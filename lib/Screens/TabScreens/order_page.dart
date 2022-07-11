import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/invoice.dart';
import 'package:kied/services/order_page_controller.dart';

import 'tabpage.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);
  InvoiceData inv = InvoiceData();
  OrderController oc = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: // WillPopScope(
              // onWillPop: () async {
              //   Get.back<InvoiceData>(result: inv);
              //   return true;
              // },
              // child:
              Container(
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
                formqstn(
                  data: 'Order Number',
                  hint: 'Order Number',
                  onchanged: (text) {
                    inv.orderNo = text;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text('Orders'),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Add Order'),
                        onPressed: () async {
                          oc.add();
                          oc.update();
                          print("len${oc.items.length}");
                        },
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: oc.items.length,
                  itemBuilder: (context, ind) {
                    return Row(
                      children: [
                        Expanded(
                          child: formqstn(
                            data: 'Item',
                            hint: 'Enter Item Name',
                            onchanged: (text) {
                              oc.editName(text, ind);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Quantity',
                            hint: 'Enter Quantity',
                            onchanged: (text) {
                              oc.editQuantity(double.tryParse(text) ?? 0, ind);
                            },
                          ),
                        ),
                        Expanded(
                          child: formqstn(
                            data: 'Rate',
                            hint: 'Enter Rate',
                            onchanged: (text) {
                              oc.editRate(double.tryParse(text) ?? 0, ind);
                            },
                          ),
                        ),
                        Expanded(
                          child: Text('${oc.totalprice.value}'),
                        ),
                      ],
                    );
                  },
                )),
                Row(
                  children: [
                    Expanded(
                      child: Text('${inv.amount}'),
                    ),
                    Expanded(
                      child: formqstn(
                        data: 'Tax Percent',
                        hint: 'Enter Tax Percent',
                        onchanged: (text) {
                          inv.taxPercent = double.tryParse(text) ?? 0;
                        },
                      ),
                    ),
                    Expanded(
                      child: Text('${inv.amount}'),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.back<InvoiceData>(result: inv);
                    },
                    child: Text('Add Order'))
              ],
            ),
          ),
        ));
  }
}
