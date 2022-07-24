import 'dart:io';

import 'package:kied/model/invoice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PDFMaker {
  static Future<File> makeCustomInvoice(InvoiceData data) async {
    String iorb = data.isInvoice ? 'Invoice' : 'Bill';
    final pdf = Document();

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(data.isInvoice ? 'INVOICE' : 'BILL',
                            style: TextStyle(fontSize: 40)),
                      ),
                    ),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("$iorb To:"),
                                Text(data.receiverName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(data.receiverAddress)
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('iorb No: ${data.invoiceNo}'),
                                  Text('iorb Date: ${data.issueDate}'),
                                  Text('Due Date: ${data.dueDate}')
                                ])
                          ]),
                    ),
                    Column(children: [
                      Divider(),
                      Row(children: [
                        Expanded(
                            child: Text('Sl No',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 2,
                            child: Text('Item',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('Quantity',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('Rate',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('Price',
                                style: TextStyle(fontWeight: FontWeight.bold)))
                      ])
                    ]),
                    for (int i = 0; i < data.orders.length; i++)
                      Column(children: [
                        Divider(),
                        Row(children: [
                          Expanded(
                              child: Text('${i + 1}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 2,
                              child: Text(data.orders[i].name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text(data.orders[i].quantity.toString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text(data.orders[i].rate.toString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text(data.orders[i].price.toString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))
                        ])
                      ]),
                    SizedBox(height: 30),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Sub Total: ${data.amount} Rs',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                'Tax: Rs ${(data.taxPercent / 100) * data.amount} (${data.taxPercent}%)',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                'Total: Rs ${((100 + data.taxPercent) / 100) * data.amount}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                          ]),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(data.companyName),
                                  Text('Signature')
                                ]))),
                  ]));
        }));
    String filename = ((data.isInvoice ? 'I' : 'B') + data.invoiceNo);
    if (filename == '') {
      filename = DateTime.now().toIso8601String().substring(0, 16);
    }
    Directory? output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/$filename.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
