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
      body: Container(
        decoration: BoxDecoration(color: background),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GetBuilder<AiController>(
              builder: (controller) => Expanded(
                child: ListView.builder(
                  itemCount: controller.responses.length,
                  itemBuilder: (context, index) {
                    final response = controller.responses[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: banner,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          response,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: text),
                      controller: aiController.userInput,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: Text(
                            'Input Pertanyaan Tafsir Surat Al-Quran',
                            style: GoogleFonts.poppins(fontSize: 14),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(12),
                    iconSize: 30,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primary),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(const CircleBorder())),
                    onPressed: () {
                      aiController.submitForm();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
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
