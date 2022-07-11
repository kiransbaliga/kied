import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/invoice.dart';

class Controller extends GetxController {
  var count = 0.obs;
  var document = PDFDocument().obs;
  set(int value) {
    count.value = value;
  }

  setDocument(PDFDocument inv) {
    document.value = inv;
  }
}
