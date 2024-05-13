import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/Home/controllers/home_controller.dart';
import 'package:quran_app/pages/Home/views/tabs/juz_tab.dart';
import 'package:quran_app/pages/Home/views/tabs/surah_tab.dart';
import 'package:quran_app/pages/Login/controllers/login_controllers.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _welcome(context: context),
              ),
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: background,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: _tabBar(),
                ),
              )
            ],
            body: TabBarView(
              children: [
                SurahTab(),
                const JuzTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              _showProfileBottomSheet();
            },
            icon: const Icon(Icons.person_3),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            'Quran App',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: text,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showProfileBottomSheet() async {
    final userData = await homeController.getUser();
    Get.bottomSheet(
      Container(
        height: 300,
        width: double.infinity,
        color: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Haloo!',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: text,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: CircleAvatar(
                child: Text(
                  userData != null ? userData['username'][0].toUpperCase() : '',
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              userData != null ? userData['username'] : '',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: primary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(orange),
              ),
              onPressed: () {
                Get.back();
                Get.find<AuthController>().signOut();
              },
              child: Text(
                'Sign Out',
                style: GoogleFonts.poppins(
                    color: white, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
    );
  }

  FutureBuilder _welcome({required BuildContext context}) {
    return FutureBuilder<dynamic>(
      future: homeController.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assalamualaikum',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: primary,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Loading..',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: text,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          );
        } else {
          final userData = snapshot.data as Map<String, dynamic>?;
          if (userData == null) {
            return const Text('User data not found');
          } else {
            final userName = userData['username'] ?? 'Unknown';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamualaikum',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: primary,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  userName,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: text,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _lastReadBanner(),
              ],
            );
          }
        }
      },
    );
  }

  Widget _lastReadBanner() {
    return GetBuilder<HomeController>(
      builder: (controller) => FutureBuilder<Map<String, dynamic>?>(
        future: controller.getLastRead(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: banner,
              ),
              height: 131,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset('assets/svg/quran.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/last-icon.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Last Read',
                              style: GoogleFonts.poppins(
                                color: text,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Loading..',
                          style: GoogleFonts.poppins(
                            color: primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          Map<String, dynamic>? lastRead = snapshot.data;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: banner,
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 131,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset('assets/svg/quran.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/last-icon.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Last Read',
                                style: GoogleFonts.poppins(
                                  color: text,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            lastRead == null ? "-" : '${lastRead["surah"]}',
                            style: GoogleFonts.poppins(
                              color: primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            lastRead == null
                                ? "Belum ada data"
                                : 'Ayat No ${lastRead["ayat"]}',
                            style: GoogleFonts.poppins(
                              color: primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      padding: const EdgeInsets.only(bottom: 7),
      unselectedLabelColor: primary,
      labelColor: text,
      indicatorColor: text,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: const Color(0xFFAAAAAA).withOpacity(.1),
      dividerHeight: 3,
      tabs: [
        Tab(
          child: Text(
            'Surat',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Tab(
          child: Text(
            'Juz',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              Get.toNamed(RouteName.home);
              break;
            case 1:
              Get.toNamed(RouteName.ai);
              break;
            case 2:
              Get.toNamed(RouteName.bookmark);
              break;
            default:
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/quran-icon.svg'),
            label: 'Quran',
            activeIcon: SvgPicture.asset('assets/svg/quran-icon-selected.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/lamp-icon.svg'),
            label: 'AI',
            activeIcon: SvgPicture.asset('assets/svg/lamp-icon-selected.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/bookmark-icon.svg'),
            label: 'Bookmark',
            activeIcon:
                SvgPicture.asset('assets/svg/bookmark-icon-selected.svg'),
          ),
        ],
      );
}
