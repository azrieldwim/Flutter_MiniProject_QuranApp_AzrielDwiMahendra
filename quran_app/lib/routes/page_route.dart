import 'package:get/get.dart';
import 'package:quran_app/pages/Details/views/detail_screen.dart';
import 'package:quran_app/pages/Home/views/home_screen.dart';
import 'package:quran_app/pages/Introduction/views/introduction_screen.dart';
import 'package:quran_app/routes/route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.introduction,
      page: () => const IntroductionScreen(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteName.detail,
      page: () => DetailScreen(),
    ),
  ];
}
