import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vale_app/vale_app.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Vale app navigation tests', () {
    NavigatorObserver mockObserver = MockNavigatorObserver();

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<void> _buildValeAppWithObserver(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ValeApp(),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'when tapping "AAPL" stock watchlist item, should navigate to correct annual report viewer page',
        (WidgetTester tester) async {
      await _buildValeAppWithObserver(tester);
      await tester.enterText(find.byType(TextField), 'aapl');
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // Check that stock watchlist item was created
      expect(find.text('AAPL'), findsOneWidget);

      // Check that pressing stock watchlist items
      // navigates to the annual report viewer for that stock
      await tester.tap(find.byKey(Key('AAPL0')));
      await tester.pumpAndSettle();
      expect(find.text('AAPL annual report'), findsOneWidget);
      expect(find.text('<annual report>'), findsOneWidget);
    });
  });
}
