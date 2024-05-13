import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/Bookmark/controllers/bookmark_controller.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({super.key});
  final bookmarkController = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'Bookmarks',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: text,
          ),
        ),
        centerTitle: false,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: GetBuilder<BookmarkController>(
        builder: (controller) {
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: bookmarkController.getBookmark(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    'Bookmark Tidak Tersedia',
                    style: GoogleFonts.poppins(
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(10),
                separatorBuilder: (context, index) => Divider(
                  color: const Color(0xFF7B80AD).withOpacity(0.35),
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = snapshot.data![index];
                  return ListTile(
                    onTap: () {
                      Get.dialog(AlertDialog(
                        backgroundColor: bottom,
                        title: Text(
                          'Edit Note',
                          style: GoogleFonts.poppins(
                              color: text, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 14),
                            TextFormField(
                              controller: bookmarkController.noteController,
                              decoration: const InputDecoration(
                                labelText: 'Edit Catatan',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(orange)),
                            onPressed: () => Get.back(),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                  color: text, fontWeight: FontWeight.w500),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(orange)),
                            onPressed: () {
                              bookmarkController.editBookmark(data["id"]);
                            },
                            child: Text(
                              'Edit Note',
                              style: GoogleFonts.poppins(
                                  color: text, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ));
                    },
                    leading: Stack(
                      children: [
                        SvgPicture.asset('assets/svg/nomor-surah.svg'),
                        SizedBox(
                          height: 38,
                          width: 38,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.poppins(
                                color: text,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    title: Text(
                      '${data["surah"]}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: text,
                      ),
                    ),
                    subtitle: Text(
                      'Ayat ${data["ayat"]} - ${data["note"]}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: primary,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        bookmarkController.deleteBookmark(data["id"]);
                      },
                    ),
                  );
                },
              );
            },
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
        currentIndex: 2,
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