import 'order_item.dart';

/// Class for both Invoice data and Bill data.
class InvoiceData {
  ///If isInvoice, then Invoice, else Bill.
  bool isInvoice = true;
  String receiverName = '',
      receiverAddress = '',
      compnayAddress = '',
      companyName = '';
  String invoiceNo = '', orderNo = '';
  DateTime issueDate = DateTime(2022), dueDate = DateTime(2023);
  List<OrderItem> orders = [];
  double amount = 0, taxPercent = 0;

  String get getIssueDate {
    return beautifiedDate(issueDate);
  }

  String get getdueDate {
    return beautifiedDate(issueDate);
  }

  String beautifiedDate(DateTime dt) {
    return "${dt.day} ${dt.month} ${dt.year}";
  }
}
