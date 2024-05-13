import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/themes/colors.dart';

class BookmarkController extends GetxController {
  final userUID = supabase.auth.currentUser!.id;

  final TextEditingController noteController = TextEditingController();

  void deleteBookmark(int id) async {
    await supabase
        .from("bookmark")
        .delete()
        .eq('id', id)
        .eq('user_id', userUID);
    update();
    Get.snackbar("Berhasil", "Telah Berhasil menghapus bookmark",
        colorText: white, backgroundColor: primary);
  }

  editBookmark(int id) async {
    await supabase
        .from("bookmark")
        .update(
          {
            "note": noteController.text,
          },
        )
        .eq('id', id)
        .eq('user_id', userUID);
    noteController.clear();
    update();
    Get.back();
    Get.snackbar("Berhasil", "Telah Berhasil mengedit bookmark",
        colorText: white, backgroundColor: primary);
  }

  Future<List<Map<String, dynamic>>> getBookmark() async {
    var dataBookmarks = supabase
        .from("bookmark")
        .select()
        .eq('last_read', 0)
        .eq('user_id', userUID);
    return dataBookmarks;
  }
}
