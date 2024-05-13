import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:quran_app/pages/Login/views/signin_screen.dart';

void main() {
  testWidgets("Testing SignInScreen UI", (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: SignInScreens(),
    ));

    expect(find.byKey(const Key('TitleSignIn')), findsOneWidget);
    expect(find.byKey(const Key('emailTextField')), findsOneWidget);
    expect(find.byKey(const Key('passwordTextField')), findsOneWidget);
    expect(find.byKey(const Key('SignInButton')), findsOneWidget);
    expect(find.byKey(const Key('teksDonthaveanaccount')), findsOneWidget);
    expect(find.byKey(const Key('SignUpButton')), findsOneWidget);

    await tester.pump();
  });
}
