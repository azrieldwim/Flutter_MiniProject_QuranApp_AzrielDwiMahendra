import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/main.dart';

class HomeController extends GetxController {
  final userUID = supabase.auth.currentUser!.id;

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

  Future<Map<String, dynamic>?> getLastRead() async {
    var lastRead = await supabase
        .from('bookmark')
        .select()
        .eq('last_read', 1)
        .eq('user_id', userUID)
        .single();
    return lastRead;
  }

  Future<dynamic> getUser() async {
    var response =
        await supabase.from('user').select().eq('user_id', userUID).single();
    return response;
  }
}
