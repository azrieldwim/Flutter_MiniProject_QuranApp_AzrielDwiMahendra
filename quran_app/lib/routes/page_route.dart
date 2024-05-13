import 'package:get/get.dart';
import 'package:quran_app/pages/AI/views/ai_screen.dart';
import 'package:quran_app/pages/Bookmark/views/bookmark_screen.dart';
import 'package:quran_app/pages/Details/views/detail_screen.dart';
import 'package:quran_app/pages/Home/views/home_screen.dart';
import 'package:quran_app/pages/Introduction/views/introduction_screen.dart';
import 'package:quran_app/pages/Login/views/signin_screen.dart';
import 'package:quran_app/pages/Login/views/signup_screen.dart';
import 'package:quran_app/routes/route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.introduction,
      page: () => const IntroductionScreen(),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => SignUpScreens(),
    ),
    GetPage(
      name: RouteName.signin,
      page: () => SignInScreens(),
    ),
    GetPage(
      name: RouteName.home,
      page: () =>  HomeScreen(),
    ),
    GetPage(
      name: RouteName.detail,
      page: () => DetailScreen(),
    ),
    GetPage(
      name: RouteName.bookmark,
      page: () => BookmarkScreen(),
    ),
    GetPage(
      name: RouteName.ai,
      page: () => AiScreen(),
    ),
  ];
}
