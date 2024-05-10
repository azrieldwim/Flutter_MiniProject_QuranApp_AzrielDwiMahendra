import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/Home/views/tabs/hijb_tab.dart';
import 'package:quran_app/pages/Home/views/tabs/page_tab.dart';
import 'package:quran_app/pages/Home/views/tabs/para_tab.dart';
import 'package:quran_app/pages/Home/views/tabs/surah_tab.dart';
import 'package:quran_app/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
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
                const ParaTab(),
                const PageTab(),
                const HijbTab()
              ],
            ),
          ),
        ),
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
            'Surah',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Tab(
          child: Text(
            'Para',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Tab(
          child: Text(
            'Page',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Tab(
          child: Text(
            'Hijb',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Column _welcome({required BuildContext context}) {
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
          'Azriel Dwi Mahendra',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: text,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead(context: context),
      ],
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
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/menu-icon.svg'),
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
            icon: SvgPicture.asset('assets/svg/search-icon.svg'),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/quran-icon.svg'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/lamp-icon.svg'),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/shalat-icon.svg'),
            label: 'Shalat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/pray-icon.svg'),
            label: 'Pray',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/bookmark-icon.svg'),
            label: 'Bookmark',
          ),
        ],
      );
}

Container _lastRead({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: banner,
    ),
    child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        // onTap: () => Get.toNamed(),
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
                      'Al-Fatihah',
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
                      'Ayat No: 1',
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
    ),
  );
}
