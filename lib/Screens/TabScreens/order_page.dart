import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/invoice.dart';
import 'package:kied/services/order_page_controller.dart';

import 'tabpage.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key, required this.inv}) : super(key: key);
  InvoiceData inv = InvoiceData();

  @override
  Widget build(BuildContext context) {
    OrderController oc = Get.put(
        OrderController(inv.orders.obs, inv.taxPercent.obs, inv.amount.obs));
    return Scaffold(
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
                      print("len${oc.items.length}");
                    },
                  ),
                )
              ],
            ),
            Row(
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
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: oc.items.length,
                    itemBuilder: (context, ind) {
                      return Row(
                        children: [
                          Expanded(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                hintText: 'Enter Item',
                              ),
                              onChanged: (text) {
                                oc.editName(text, ind);
                              },
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                hintText: 'Enter Item',
                              ),
                              onChanged: (text) {
                                oc.editQuantity(
                                    double.tryParse(text) ?? 0, ind);
                              },
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                hintText: 'Enter Item',
                              ),
                              onChanged: (text) {
                                oc.editRate(double.tryParse(text) ?? 0, ind);
                              },
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => Text('${oc.items[ind].price}'),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price without Price',
                      style: TextStyle(
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
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: Color(0xff14D19D),
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
            ElevatedButton(
                onPressed: () {
                  Get.back<InvoiceData>(
                      result: InvoiceData(
                          orderNo: inv.orderNo,
                          orders: oc.items.toList(),
                          taxPercent: oc.taxr.value,
                          amount: oc.totalprice.value));
                },
                child: Text('Add Order'))
          ],
        ),
      ),
    );
  }
}
