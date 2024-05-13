import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quran_app/models/detail_surah.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/themes/colors.dart';

class DetailController extends GetxController {
  final TextEditingController noteController = TextEditingController();
  final userUID = supabase.auth.currentUser!.id;

  Future<DetailSurah> getDetailSurah(String noSurah) async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat/$noSurah");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  Future addBookmark(bool lastRead, DetailSurah surah, int indexAyat) async {
    if (lastRead) {
      await supabase.from('bookmark').delete().eq('last_read', 1);
    } else {
      List<Map<String, dynamic>> checkData = await supabase
          .from('bookmark')
          .select()
          .eq('surah', surah.namaLatin)
          .eq('ayat', surah.ayat[indexAyat].nomorAyat)
          .eq('index_ayat', indexAyat)
          .eq('last_read', 0)
          .eq('note', noteController.text)
          .eq('user_id', userUID);

      if (checkData.isNotEmpty) {
        noteController.clear();
        Get.back();
        Get.snackbar("Gagal", "Bookmark Telah Tersedia",
            backgroundColor: Colors.red, colorText: white);
        return;
      }
    }
    await supabase.from('bookmark').insert({
      "surah": surah.namaLatin,
      "ayat": surah.ayat[indexAyat].nomorAyat,
      "index_ayat": indexAyat,
      "last_read": lastRead ? 1 : 0,
      "note": noteController.text,
      "user_id": userUID,
    });

    noteController.clear();
    Get.back();
    Get.snackbar("Berhasil", "Berhasil Menambahkan Bookmark",
        backgroundColor: banner);
    var data = await supabase.from('bookmark').select();
    print(data);
  }
}
