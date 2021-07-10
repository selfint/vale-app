import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vale_app/stock_watchlist.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Add and remove a stock from watchlist',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StockWatchlist());
    await tester.enterText(find.byType(TextField), 'aapl');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Check that ticker text was converted to uppercase
    expect(find.text('AAPL'), findsOneWidget);

    // Check that we can dismiss the widget
    await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // Ensure that the item is no longer on screen.
    expect(find.text('AAPL'), findsNothing);
  });
}
