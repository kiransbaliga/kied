import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/services/sidmenu_controller.dart';

import 'Screens/TabScreens/tabpage.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabPage(),
      navigatorKey: Get.key,
    );
  }
}
