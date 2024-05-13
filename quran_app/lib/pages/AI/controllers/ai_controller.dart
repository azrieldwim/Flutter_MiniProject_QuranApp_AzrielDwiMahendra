import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quran_app/env/constants/open_ai.dart';

class AiController extends GetxController {
  TextEditingController userInput = TextEditingController();
  List<String> responses = [];

  Future<void> submitForm() async {
    try {
      const apiUrl = 'https://api.openai.com/v1/chat/completions';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode(
          <String, dynamic>{
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content":
                    "Jika ada user yang menanyakan kamu siapa atau memberikan ucapan halo, kamu adalah AI yang membantu user untuk mengetahui tafsir dari surat - surat yang ada di dalam alquran dan juga detail mengenai alquran, jika pertanyaan diluar dari topik Al-Quran atau tafsir tolak dengan halus. Saya ingin memahami lebih dalam tentang Al-Quran. Bisakah Anda memberikan tafsir atau penjelasan terkait dengan pertanyaan ini: ${userInput.text}"
              }
            ],
            'max_tokens': 1000,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['choices'] != null &&
            responseData['choices'].isNotEmpty) {
          final bestResponse = responseData['choices'][0]['message']['content'];

          List<String> newResponseList = [bestResponse];
          print(responseData);
          responses.addAll(newResponseList);
          print('Respon sukses: $bestResponse');
          update();
        } else {
          print('Gagal mendapatkan respons dari model.');
        }
      } else {
        print('Gagal mendapatkan respons. Kode status: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    userInput.clear();
  }
}
