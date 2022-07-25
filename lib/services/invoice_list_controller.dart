import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/expense.dart';
import 'package:kied/model/invoice_for_hive.dart';
import 'package:kied/model/order_item.dart';

class InvoiceListController extends GetxController {
  RxList<InvoiceHiveModel> invoices = RxList<InvoiceHiveModel>();

  RxList<ExpenseData> expenses = RxList<ExpenseData>();

  // OrderController(this.items, this.taxr, this.totalprice);
  add(inv) {
    invoices.add(inv);
  }

  addexp(inv) {
    expenses.add(inv);
  }

  clear() {
    invoices.clear();
    expenses.clear();
  }
}
