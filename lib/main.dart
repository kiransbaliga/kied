import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kied/services/sidmenu_controller.dart';

import 'Screens/TabScreens/tabpage.dart';
import 'model/invoice_for_hive.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(InvoiceHiveModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  initHive() async {
    await Hive.openBox<InvoiceHiveModel>('invoices');

    await Hive.openBox<InvoiceHiveModel>('expenses');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    initHive();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabPage(),
      navigatorKey: Get.key,
    );
  }
}
