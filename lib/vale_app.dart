import 'package:flutter/material.dart';
import 'package:vale_app/stock_watchlist.dart';

class ValeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vale',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockWatchlist(),
    );
  }
}
