import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/order_item.dart';

class OrderController extends GetxController {
  RxDouble totalprice = (0.0).obs, taxr = (0.0).obs;
  RxList<OrderItem> items = RxList<OrderItem>();

  // OrderController(this.items, this.taxr, this.totalprice);
  add() {
    items.add(OrderItem());
  }

  editTax(double val) {
    taxr.value = val;
  }

  editName(String name, int no) {
    items[no].name = name;
  }

  editQuantity(double quantity, int no) {
    totalprice.value -= items[no].price;
    items[no].editQuantity(quantity);
    items.refresh();
    totalprice.value += items[no].price;
  }

  editRate(double rate, int no) {
    totalprice.value -= items[no].price;
    items[no].editRate(rate);
    items.refresh();
    totalprice.value += items[no].price;
  }
}
