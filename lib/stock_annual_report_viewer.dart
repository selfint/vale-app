import 'package:flutter/material.dart';

class StockAnnualReportViewer extends StatelessWidget {
  const StockAnnualReportViewer({Key? key, required this.stock})
      : super(key: key);

  final String stock;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Annual report viewer",
      home: Scaffold(
        appBar: AppBar(title: Text("$stock annual report")),
        body: Container(
          child: Text(""),
        ),
      ),
    );
  }
}
