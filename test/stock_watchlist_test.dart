import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vale_app/stock_watchlist.dart';

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const StockWatchlist());

    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextField), 'aapl');

    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find the item on screen.
    expect(find.text('aapl'), findsOneWidget);

    // Swipe the item to dismiss it.
    await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // Ensure that the item is no longer on screen.
    expect(find.text('aapl'), findsNothing);
  });
}
