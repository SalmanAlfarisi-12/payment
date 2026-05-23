import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment/main.dart';

void main() {
  testWidgets('Splash screen builds and runs smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PaymentApp());

    // Verify that the title PayFlow is rendered
    expect(find.text('PayFlow'), findsOneWidget);
  });
}
