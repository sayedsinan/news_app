import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/view/detailed_page.dart';
import 'package:news_app/view/home_page.dart';

void main() {
  Get.put(NewsService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomePage());
  }
}
