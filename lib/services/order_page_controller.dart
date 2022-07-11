import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/order_item.dart';

class OrderController extends GetxController {
  RxDouble totalprice = (0.0).obs;
  RxList<OrderItem> items = RxList<OrderItem>();
  add() {
    items.add(OrderItem());
  }

  editName(String name, int no) {
    items[no].name = name;
  }

  editQuantity(double quantity, int no) {
    totalprice.value -= items[no].price;
    items[no].editQuantity(quantity);
    totalprice.value += items[no].price;
  }

  editRate(double rate, int no) {
    totalprice.value -= items[no].price;
    items[no].editRate(rate);
    totalprice.value += items[no].price;
  }
}
