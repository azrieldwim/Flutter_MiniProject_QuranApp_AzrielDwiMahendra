import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/data/models/surah.dart';

class SurahController extends GetxController {

  Future<List<Surah>> gettAllSurah() async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat");
    var res = await http.get(url);

    List? data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}
