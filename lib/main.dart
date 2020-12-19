import 'dart:math';
import 'package:grocery_app_flutter/input_widgets/list_state.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/transaction.dart';

import 'input_widgets/input_widget.dart';
import 'input_widgets/list_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  void _startTransaction({BuildContext ctx}) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return InputWidget(
            addTransaction: _addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text('budget app'),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startTransaction(ctx: context),
              );
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Text(
                  'charts',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              ),
              ListWidget(
                transactions: _transactions,
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startTransaction(ctx: context),
          );
        }),
      ),
    );
  }
}
