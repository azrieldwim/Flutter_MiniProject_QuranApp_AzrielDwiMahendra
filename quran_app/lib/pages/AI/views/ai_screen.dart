import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/AI/controllers/ai_controller.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';

class AiScreen extends StatelessWidget {
  AiScreen({super.key});

  final aiController = Get.put(AiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        title: Text(
          'AI assistances',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: text,
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: GetBuilder<AiController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: DashChat(
                  currentUser: controller.myself,
                  messages: controller.responses,
                  messageOptions: MessageOptions(
                    messagePadding: const EdgeInsets.all(12),
                    containerColor: banner,
                    showTime: true,
                  ),
                  inputOptions: InputOptions(
                    autocorrect: false,
                    inputDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: Text(
                          'Input Pertanyaan Tafsir Surat Al-Quran',
                          style: GoogleFonts.poppins(fontSize: 14),
                        )),
                  ),
                  onSend: (message) {
                    controller.submitForm(message);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1,
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
