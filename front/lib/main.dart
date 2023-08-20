import 'package:flutter/material.dart';
import 'package:front/controllers/data_controller.dart';
import 'package:front/routes/routes.dart';
import 'package:front/screens/home_screen.dart';
import 'package:get/get.dart';

// adb reverse tcp:8000 tcp:8000

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void loadData() async {
    await Get.find<DataController>().getData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
      home: const HomeScreen(),
    );
  }
}
