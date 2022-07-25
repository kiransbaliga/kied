import 'package:kied/model/invoice_for_hive.dart';

import 'order_item.dart';

/// Class for both Invoice data and Bill data.
class InvoiceData {
  ///If isInvoice, then Invoice, else Bill.
  bool isInvoice = true;
  String receiverName = '',
      receiverAddress = '',
      compnayAddress = '',
      companyName = '',
      note = '';
  String invoiceNo = '', orderNo = '';
  String issueDate = '', dueDate = '', filePath = '';
  List<OrderItem> orders = [];
  double amount = 0, taxPercent = 0;

  InvoiceData(
      {this.amount = 0,
      this.companyName = '',
      this.compnayAddress = '',
      this.dueDate = '',
      this.invoiceNo = '',
      this.isInvoice = true,
      this.issueDate = '',
      this.note = '',
      this.orderNo = '',
      this.orders = const [],
      this.receiverAddress = '',
      this.receiverName = '',
      this.taxPercent = 0});

  // InvoiceData.fromJson(Map map) {
  //   this.amount = map['amount'];
  //   this.companyName = map['company'];
  //   this.compnayAddress = map['companyAddress'];
  //   this.dueDate = map[''];
  //   this.invoiceNo = map[''];
  //   this.isInvoice = true;
  //   this.issueDate = map[''];
  //   this.note = map[''];
  //   this.orderNo = map[''];
  //   this.orders = const [];
  //   this.receiverAddress = map[''];
  //   this.receiverName = map[''];
  //   this.taxPercent = map[''];
  // }

  InvoiceHiveModel toHiveInvoice() {
    return InvoiceHiveModel(
      amount: amount,
      companyName: companyName,
      compnayAddress: compnayAddress,
      dueDate: dueDate,
      invoiceNo: invoiceNo,
      isInvoice: isInvoice,
      issueDate: issueDate,
      note: note,
      orderNo: orderNo,
      receiverAddress: receiverAddress,
      receiverName: receiverName,
      taxPercent: taxPercent,
    );
  }

  // String get getIssueDate {
  //   return beautifiedDate(issueDate ?? DateTime(2022));
  // }

  // String get getdueDate {
  //   return beautifiedDate(dueDate ?? DateTime(2023));
  // }
  double get getTotalAmount {
    return (taxPercent * amount / 100) + amount;
  }

  String beautifiedDate(DateTime dt) {
    return "${dt.day} ${dt.month} ${dt.year}";
  }

  void edit({orderNo, orders, taxPercent, amount}) {
    this.orderNo = orderNo;
    this.orders = orders;
    this.taxPercent = taxPercent;
    this.amount = amount;
  }

  void updatePath(String path) {
    filePath = path;
  }
}
