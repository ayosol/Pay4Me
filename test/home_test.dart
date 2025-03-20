import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay4me/ui/screens/homescreen.dart';


void main() {
  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Community'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Tapping FAB opens the Create Post bottom sheet', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    expect(find.text('Write your post'), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Write your post'), findsOneWidget);
  });

  testWidgets('User can type in post text field', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // find textfield by key since there are multiple textfields on the homepage
    final textField = find.byKey(ValueKey('post_text_field'));
    await tester.enterText(textField, 'Hello, Flutter!');

    await tester.pump();

    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });

  testWidgets('User can type in search bar', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    final searchField = find.byType(TextField);
    await tester.enterText(searchField, 'testing');
    await tester.pump();

    expect(find.text('testing'), findsOneWidget);
  });

  testWidgets('Search bar returns result after user entry', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    final searchField = find.byKey(ValueKey('search_bar_key'));
    await tester.enterText(searchField, 'Jane');
    await tester.pump();

  });

}