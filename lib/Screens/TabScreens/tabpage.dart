// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/Screens/TabScreens/analytics.dart';
import 'package:kied/Screens/TabScreens/show_pdf_screen.dart';
import 'package:kied/services/sidmenu_controller.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../widgets/sidenavbar.dart';
import '../../widgets/sidemenubar.dart';
import 'invoice.dart';
import 'billing.dart';

StatelessWidget whichfun(var id) {
  switch (id) {
    case 0:
      return Invoice();
    case 1:
      return Billing();
    default:
      return Invoice();
  }
}

class TabPage extends StatelessWidget {
  TabPage({Key? key}) : super(key: key);
  int idx = 1;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    return Scaffold(
      body: Row(
        children: [
          sidenavbar(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(29, 162, 180, 206),
            ),
            child: sidemenubar(),
          ),
          Obx(() {
            switch (c.count.value) {
              case 0:
                return Invoice();
              case 1:
                return Billing();
              case 3:
                return Analytics();
              case 5:
                return ShowPdfPage();

              default:
                return Invoice();
            }
          }),
        ],
      ),
    );
  }
}

class formqstn extends StatelessWidget {
  final String hint, data;
  final Function(String) onchanged;
  final TextEditingController? tec;
  const formqstn(
      {Key? key,
      required this.data,
      required this.hint,
      required this.onchanged,
      this.tec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
              color: Color(0xff14D19D),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              hintText: hint,
            ),
            onChanged: onchanged,
          ),
        ],
      ),
    );
  }
}
