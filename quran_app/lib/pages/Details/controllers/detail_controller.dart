import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/data/db/bookmark_db.dart';
import 'dart:convert';
import 'package:quran_app/data/models/detail_surah.dart';
// import 'package:sqflite/sqflite.dart';

class DetailController extends GetxController {
  final DatabaseManager database = DatabaseManager.instance;
  final TextEditingController nameController = TextEditingController();

  Future<DetailSurah> getDetailSurah(String noSurah) async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat/$noSurah");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  // void addBookmark(bool lastRead, DetailSurah surah, int indexAyat) async {
  //   Database db = await database.db;

  //   db.insert(
  //     "bookmark",
  //     {
  //       "surah": surah.namaLatin,
  //       "ayat": surah.ayat[indexAyat].nomorAyat,
  //       "via": "surah",
  //       "index_ayat": indexAyat,
  //       "last_read": lastRead == true ? 1 : 0,
  //     },
  //   );
  //   Get.back();
  //   Get.snackbar("Berhasil", "Berhasil Menambahkan Bookmark");

  //   var data = await db.query("bookmark");
  //   print(data);
  // }
}
