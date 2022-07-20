import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/invoice.dart';
import 'package:kied/services/order_page_controller.dart';

import '../../services/sidmenu_controller.dart';
import 'tabpage.dart';

class OrderPage extends StatelessWidget {
  OrderPage({
    Key? key,
  }) : super(key: key);
  InvoiceData inv = InvoiceData();

  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    OrderController oc = Get.put(OrderController(c.invoicedata.value.orders.obs,
        c.invoicedata.value.taxPercent.obs, c.invoicedata.value.amount.obs));
    inv = c.invoicedata.value;
    return //Scaffold(
        //body: // WillPopScope(
        // onWillPop: () async {
        //   Get.back<InvoiceData>(result: inv);
        //   return true;
        // },
        Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: const Color.fromARGB(69, 224, 224, 254),
        ),
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 43,
                  ),
                  const Image(
                    width: 800,
                    image: AssetImage('assets/images/invoice-banner.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              formqstn(
                data: 'Order Number',
                hint: 'Order Number',
                onchanged: (text) {
                  c.invoicedata.value.orderNo = text;
                },
                tec: TextEditingController(text: c.invoicedata.value.orderNo),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Orders',
                      style: TextStyle(
                        color: Color(0xff14D19D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        child: const Text('Add Order'),
                        onPressed: () async {
                          oc.add();
                        },
                      ),
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
                      tec: TextEditingController(
                          text: '${c.invoicedata.value.taxPercent}'),
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
              ElevatedButton(
                  onPressed: () {
                    c.invoicedata.value = InvoiceData(
                        orderNo: c.invoicedata.value.orderNo,
                        orders: oc.items.toList(),
                        taxPercent: oc.taxr.value,
                        amount: oc.totalprice.value);
                    c.count.value = 0;
                  },
                  child: const Text('Add Order'))
            ],
          ),
        ),
      ),
    );
  }
}
