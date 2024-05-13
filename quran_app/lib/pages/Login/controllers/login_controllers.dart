import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      await supabase.auth.signUp(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );

      final userUID = supabase.auth.currentUser!.id;

      await supabase.from('user').insert(
        {'user_id': userUID, 'username': usernameController.text.trim()},
      );

      Get.toNamed(RouteName.home);
      clearControllers();
      Get.snackbar(
        'Sign Up Success',
        'You have successfully signed up!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on AuthException catch (e) {
      print(e.message);
      Get.snackbar(
        'Sign Up Error',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signIn() async {
    try {
      await supabase.auth.signInWithPassword(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );

      Get.toNamed(RouteName.home);
      clearControllers();
      Get.snackbar(
        'Sign In Success',
        'You have successfully signed in!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on AuthException catch (e) {
      print(e.message);
      Get.snackbar(
        'Sign In Error',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
      Get.toNamed(RouteName.signup);
      clearControllers();
      Get.snackbar(
        'Sign Out Success',
        'You have successfully signed out!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Sign Out Error',
        'An error occurred during sign out',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
