import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  set(int value){
    count.value = value;
  }
}