// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

Column sidemenubar() {
  int idx = 0;
  return Column(
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
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(
            width: 200,
            image: AssetImage('assets/images/invoice.png'),
          ),
          SizedBox(
            height: 30,
          ),
          Image(
            width: 200,
            image: AssetImage('assets/images/billing.png'),
          ),
          SizedBox(
            height: 30,
          ),
          Image(
            width: 200,
            image: AssetImage('assets/images/expenses.png'),
          ),
          SizedBox(
            height: 30,
          ),
          Image(
            width: 200,
            image: AssetImage('assets/images/analytics.png'),
          ),
        ],
      ),
    ],
  );
}
