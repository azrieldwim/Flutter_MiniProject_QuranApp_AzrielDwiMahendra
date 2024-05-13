import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/routes/page_route.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ocazioupoqidwxhaeotj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9jYXppb3Vwb3FpZHd4aGFlb3RqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUzMTU4MjgsImV4cCI6MjAzMDg5MTgyOH0.jXIgTw5gg-yjaG38mfzhlgj4kZwUUG9rE3b3yJ0jwqk',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

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
