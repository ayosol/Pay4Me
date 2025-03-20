import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay4me/ui/widgets/search_bar.dart';




void main() {
  testWidgets('SearchBarWidget filters and displays results based on input',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: SearchBarWidget(),
              ),
            ),
          ),
        );

        final searchField = find.byType(TextField);
        expect(searchField, findsOneWidget);

        await tester.enterText(searchField, 'John');
        await tester.pumpAndSettle();

        expect(find.text('John Doe'), findsOneWidget);
        expect(find.text('Johnathan Doe'), findsOneWidget);
        expect(find.text('Jane Smith'), findsNothing);

        await tester.enterText(searchField, 'Sarah');
        await tester.pumpAndSettle();

        expect(find.text('Sarah Brown'), findsOneWidget);
        expect(find.text('Sarah Wilson'), findsOneWidget);
        expect(find.text('John Doe'), findsNothing);
      });
}
