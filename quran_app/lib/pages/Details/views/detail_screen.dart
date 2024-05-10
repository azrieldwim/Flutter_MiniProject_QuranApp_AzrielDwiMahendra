import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/data/models/detail_surah.dart';
import 'package:quran_app/data/models/surah.dart';
import 'package:quran_app/pages/Details/controllers/detail_controller.dart';
import 'package:quran_app/themes/colors.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final detailcontroller = Get.put(DetailController());

  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailSurah>(
      future: detailcontroller.getDetailSurah(surah.nomor.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: background,
            body: Center(
              child: Text(
                'Tidak Ada Data',
                style: GoogleFonts.poppins(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        DetailSurah detailSurah = snapshot.data!;
        return Scaffold(
          backgroundColor: background,
          appBar: _appBar(context: context, detailSurah: detailSurah),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _detailsBanner(detailSurah),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                  itemCount: detailSurah.jumlahAyat,
                  itemBuilder: (context, index) =>
                      _ayatItem(detailSurah, index, context)),
            ),
          ),
        );
      },
    );
  }

  Padding _ayatItem(DetailSurah detailSurah, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: bottom,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(27 / 2),
                  ),
                  child: Center(
                    child: Text(
                      '${detailSurah.ayat[index].nomorAyat}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/svg/share-icon.svg'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/svg/play-icon.svg'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    _showBookmarkDialog(context, detailSurah, index);
                  },
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/svg/bookmark2-icon.svg'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            detailSurah.ayat[index].teksArab,
            style: GoogleFonts.amiri(
              color: text,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            detailSurah.ayat[index].teksLatin,
            style: GoogleFonts.poppins(
              color: primary,
              fontSize: 16,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            detailSurah.ayat[index].teksIndonesia,
            style: GoogleFonts.poppins(
              color: primary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  void _showBookmarkDialog(
      BuildContext context, DetailSurah detailSurah, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bottom,
          title: Text(
            'BOOKMARK',
            style:
                GoogleFonts.poppins(color: text, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Tambahkan Catatan",
                style: GoogleFonts.poppins(
                    color: primary, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: detailcontroller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Catatan',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(orange)),
              onPressed: () {
                // detailcontroller.addBookmark(true, detailSurah, index);
              },
              child: Text(
                'Last Read',
                style: GoogleFonts.poppins(
                    color: text, fontWeight: FontWeight.w500),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(orange)),
              onPressed: () {
                // detailcontroller.addBookmark(false, detailSurah, index);
              },
              child: Text(
                'Add Note',
                style: GoogleFonts.poppins(
                    color: text, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  Padding _detailsBanner(DetailSurah detailSurah) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Container(
            height: 257,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: banner,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                'assets/svg/quran.svg',
                width: 279,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  detailSurah.namaLatin,
                  style: GoogleFonts.poppins(
                    color: text,
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  detailSurah.arti,
                  style: GoogleFonts.poppins(
                    color: primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Divider(
                  color: primary.withOpacity(0.35),
                  thickness: 2,
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      detailSurah.tempatTurun,
                      style: GoogleFonts.poppins(
                        color: primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: primary.withOpacity(0.35)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${detailSurah.jumlahAyat} Ayat',
                      style: GoogleFonts.poppins(
                        color: primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset('assets/svg/bismillah.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(
      {required BuildContext context, required DetailSurah detailSurah}) {
    return AppBar(
      backgroundColor: background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset('assets/svg/back-icon.svg'),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            detailSurah.namaLatin,
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
}
