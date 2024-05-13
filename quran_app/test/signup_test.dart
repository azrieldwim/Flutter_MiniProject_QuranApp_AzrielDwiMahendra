import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:quran_app/pages/Login/views/signup_screen.dart';

void main() {
  testWidgets("Testing SignUpScreen UI", (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: SignUpScreens(),
    ));

    expect(find.byKey(const Key('TitleSignUp')), findsOneWidget);
    expect(find.byKey(const Key('usernameTextField')), findsOneWidget);
    expect(find.byKey(const Key('emailTextField')), findsOneWidget);
    expect(find.byKey(const Key('passwordTextField')), findsOneWidget);
    expect(find.byKey(const Key('SignUpButton')), findsOneWidget);
    expect(find.byKey(const Key('teksAlreadyhaveanaccount')), findsOneWidget);
    expect(find.byKey(const Key('SignInButton')), findsOneWidget);

    await tester.pump();
  });
}
