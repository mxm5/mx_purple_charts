import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/input_widgets/input_widget.dart';
import 'package:grocery_app_flutter/input_widgets/list_widget.dart';

import '../transaction.dart';

class ListOfItems extends StatefulWidget {
  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  final List<Transaction> _transactions = [
    Transaction(
        amount: 25.99,
        date: DateTime.now(),
        id: 'Hxl352lvz',
        title: 'new shoes'),
    Transaction(
        amount: 35.99,
        date: DateTime.now(),
        id: 'xnjr353',
        title: 'grocery things'),
    Transaction(
        amount: 77.99,
        date: DateTime.now(),
        id: 'fnkj30789',
        title: 'water for trip')
  ];

  void _addTransaction(Transaction addedTransaction) {
    setState(() {
      _transactions.add(addedTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputWidget(
          addTransaction: _addTransaction,
        ),
        ListWidget(
          transactions: _transactions,
        ),
      ],
    );
  }
}
