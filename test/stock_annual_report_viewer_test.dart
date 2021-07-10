import 'package:flutter_test/flutter_test.dart';

import 'package:vale_app/stock_annual_report_viewer.dart';

void main() {
  testWidgets('Create stock annual report viewer', (WidgetTester tester) async {
    await tester.pumpWidget(const StockAnnualReportViewer(stock: 'AAPL'));
    expect(find.text('AAPL annual report'), findsOneWidget);
  });
}
