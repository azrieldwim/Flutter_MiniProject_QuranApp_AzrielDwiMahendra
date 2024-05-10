import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/routes/page_route.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: text),
        useMaterial3: true,
      ),
      initialRoute: RouteName.introduction,
      getPages: AppPage.pages,
    );
  }
}
