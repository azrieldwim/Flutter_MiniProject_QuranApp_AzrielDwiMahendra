import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/Login/controllers/login_controllers.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/themes/colors.dart';

class SignInScreens extends StatelessWidget {
  SignInScreens({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // key: const Key('TitleSignIn'),
                  'Sign In',
                  style: GoogleFonts.poppins(
                      color: text, fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      // key: const Key('emailTextField'),
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: primary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: primary),
                        ),
                        hintStyle: TextStyle(fontSize: 13.0, color: primary),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      // key: const Key('passwordTextField'),
                      obscureText: true,
                      controller: authController.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: primary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: primary),
                        ),
                        hintStyle: TextStyle(fontSize: 12.0, color: primary),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    // key: const Key('SignInButton'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(orange),
                    ),
                    onPressed: authController.signIn,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins(
                          color: text, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // key: const Key('teksDonthaveanaccount'),
                      'Dont have an account?',
                      style: GoogleFonts.poppins(color: text),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      // key: const Key('SignUpButton'),
                      onTap: () => Get.toNamed(RouteName.signup),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                            color: orange, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
