// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:get/get.dart';

import '../services/sidmenu_controller.dart';

Widget sidemenubar() {
  final Controller c = Get.put(Controller());
  return SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(Get.context!).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Bizzness',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          InkWell(
              child: Image(
                width: 200,
                image: AssetImage('assets/images/invoice.png'),
              ),
              onTap: () {
                c.set(0);
                print(0);
              }),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Image(
              width: 200,
              image: AssetImage('assets/images/billing.png'),
            ),
            onTap: () {
              c.set(1);
            },
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Image(
              width: 200,
              image: AssetImage('assets/images/expenses.png'),
            ),
            onTap: () {
              c.set(2);
            },
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Image(
              width: 200,
              image: AssetImage('assets/images/analytics.png'),
            ),
            onTap: () {
              c.set(3);
            },
          ),
          //   ],
          // ),
        ],
      ),
    ),
  );
}
