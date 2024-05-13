import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:quran_app/pages/Introduction/views/introduction_screen.dart';

void main() {
  testWidgets("Testing IntroductionScreen UI", (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: IntroductionScreen(),
    ));

    expect(find.byKey(const Key('TittleQuranApps')), findsOneWidget);
    expect(find.byKey(const Key('SubtittleQuranApps')), findsOneWidget);
    expect(find.byKey(const Key('Animasi')), findsOneWidget);
    expect(find.byKey(const Key('ButtonGetStarted')), findsOneWidget);

    await tester.pump();
  });
}
