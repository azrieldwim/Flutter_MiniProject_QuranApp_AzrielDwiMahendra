import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/pages/Home/controllers/home_controller.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';

class SurahTab extends StatelessWidget {
  final controller = Get.put(HomeController());
  SurahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.gettAllSurah(),
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
                  color: text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        return ListView.separated(
          itemCount: snapshot.data!.length,
          separatorBuilder: (context, index) => Divider(
            color: const Color(0xFF7B80AD).withOpacity(0.35),
          ),
          itemBuilder: (context, index) {
            Surah surah = snapshot.data![index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteName.detail, arguments: surah);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset('assets/svg/nomor-surah.svg'),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Center(
                            child: Text(
                              '${surah.nomor}',
                              style: GoogleFonts.poppins(
                                color: text,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surah.namaLatin,
                            style: GoogleFonts.poppins(
                              color: text,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                surah.tempatTurun,
                                style: GoogleFonts.poppins(
                                  color: primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
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
                                    color: text.withOpacity(0.35)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${surah.jumlahAyat} Ayat',
                                style: GoogleFonts.poppins(
                                  color: primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      surah.nama,
                      style: GoogleFonts.amiri(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
