import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay4me/ui/screens/homescreen.dart';

void main() {
  testWidgets('User can type in post text field', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    // Ensure FloatingActionButton exists
    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);

    await tester.tap(fabFinder);
    await tester.pumpAndSettle();

    // Find the TextField
    final textField = find.byKey(ValueKey("post_text_field"));
    expect(textField, findsOneWidget);

    // Enter text into the TextField
    await tester.enterText(textField, 'Testing Testing');
    await tester.pump();

    // Verify that the text is entered correctly
    expect(find.text('Testing Testing'), findsOneWidget);
  });
}