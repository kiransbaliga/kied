import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/invoice.dart';

class Controller extends GetxController {
  var count = 0.obs;
  var document = File('').obs;
  var invoicedata = InvoiceData().obs;
  set(int value) {
    count.value = value;
  }

  setDocument(File inv) {
    document.value = inv;
  }
}
