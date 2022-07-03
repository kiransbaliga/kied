// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../widgets/sidenavbar.dart';
import '../../widgets/sidemenubar.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          sidenavbar(),
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(29, 162, 180, 206),
            ),
            child: sidemenubar(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(69, 224, 224, 254),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 43,
                    ),
                    Image(
                      width: 800,
                      image: AssetImage('assets/images/invoice-banner.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
