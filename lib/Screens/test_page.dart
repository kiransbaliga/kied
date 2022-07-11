import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:kied/logic/pdf_maker.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // void checkPer() async {
  //   await new Future.delayed(new Duration(seconds: 1));
  //   bool checkResult = await SimplePermissions.checkPermission(
  //       Permission.WriteExternalStorage);
  //   if (!checkResult) {
  //     var status = await SimplePermissions.requestPermission(
  //         Permission.WriteExternalStorage);
  //     //print("permission request result is " + resReq.toString());
  //     if (status == PermissionStatus.authorized) {
  //       await downloadFile();
  //     }
  //   } else {
  //     await downloadFile();
  //   }
  // }

  // @override
  // void initState() {
  // TODO: implement initState
  // super.initState();
  // checkPer();
  // }

  String filename = '';
  PDFDocument? document;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Test Page')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Enter File NAme'),
            onChanged: (str) {
              setState(() {
                filename = str;
              });
            },
          ),
          Center(
              child: ElevatedButton(
            child: const Text('Make PDF'),
            onPressed: () async {
              // File f = await PDFMaker.makeCustomInvoice(filename: filename);
              // document = await PDFDocument.fromFile(f);
              setState(() {});
            },
          )),
          if (document != null) Expanded(child: PDFViewer(document: document!)),
        ],
      ),
    );
  }
}
