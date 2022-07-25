import 'package:hive/hive.dart';
import 'package:kied/model/invoice.dart';

part 'invoice_for_hive.g.dart';

@HiveType(typeId: 1)
class InvoiceHiveModel {
  @HiveField(0)
  bool isInvoice = true;
  @HiveField(1)
  String receiverName = '';

  @HiveField(2)
  String receiverAddress = '';

  @HiveField(3)
  String compnayAddress = '';

  @HiveField(4)
  String companyName = '';

  @HiveField(5)
  String note = '';

  @HiveField(6)
  String invoiceNo = '';

  @HiveField(7)
  String orderNo = '';

  @HiveField(8)
  String issueDate = '';
  @HiveField(9)
  String dueDate = '';

  @HiveField(10)
  double amount = 0;

  @HiveField(11)
  double taxPercent = 0;

  InvoiceHiveModel({
    this.amount = 0,
    this.companyName = '',
    this.compnayAddress = '',
    this.dueDate = '',
    this.invoiceNo = '',
    this.isInvoice = true,
    this.issueDate = '',
    this.note = '',
    this.orderNo = '',
    this.receiverAddress = '',
    this.receiverName = '',
    this.taxPercent = 0,
  });
  double get getTotalAmount {
    return (taxPercent * amount / 100) + amount;
  }

  InvoiceData toInvoice() {
    return InvoiceData(
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
        taxPercent: taxPercent);
  }
}
