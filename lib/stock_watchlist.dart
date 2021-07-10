import 'package:flutter/material.dart';

class StockWatchlist extends StatefulWidget {
  const StockWatchlist({Key? key}) : super(key: key);

  @override
  _StockWatchlistState createState() => _StockWatchlistState();
}

class _StockWatchlistState extends State<StockWatchlist> {
  static const _appTitle = 'Stock Watchlist';
  final stockWatchlist = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: stockWatchlist.length,
                itemBuilder: (BuildContext context, int index) {
                  final stock = stockWatchlist[index];

                  return Dismissible(
                    key: Key('$stock$index'),
                    onDismissed: (direction) => stockWatchlist.removeAt(index),
                    child: ListTile(title: Text(stock)),
                    background: Container(color: Colors.red),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              stockWatchlist.add(controller.text.toUpperCase());
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
