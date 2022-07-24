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
  DateTime? issueDate = DateTime(2022), dueDate = DateTime(2023);
  List<OrderItem> orders = [];
  double amount = 0, taxPercent = 0;

  InvoiceData(
      {this.amount = 0,
      this.companyName = '',
      this.compnayAddress = '',
      this.dueDate,
      this.invoiceNo = '',
      this.isInvoice = true,
      this.issueDate,
      this.note = '',
      this.orderNo = '',
      this.orders = const [],
      this.receiverAddress = '',
      this.receiverName = '',
      this.taxPercent = 0});

  String get getIssueDate {
    return beautifiedDate(issueDate ?? DateTime(2022));
  }

  String get getdueDate {
    return beautifiedDate(dueDate ?? DateTime(2023));
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
}
