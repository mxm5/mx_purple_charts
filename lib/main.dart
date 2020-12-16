import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
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
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('budget app'),
        ),
        body: Column(
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
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleInputController,
                    cursorColor: Colors.purple,
                    decoration: InputDecoration(
                      labelText: 'title',
                    ),
                  ),
                  TextField(
                    cursorColor: Colors.purple,
                    controller: amountInputController,
                    decoration: InputDecoration(
                      labelText: 'amount',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(7),
                    color: Colors.purple[50],
                    child: FlatButton(
                        onPressed: () {
                          print(titleInputController.text);
                          print(amountInputController.text);
                        },
                        child: Text(
                          'add items',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$' + tx.amount.toString(),
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(tx.date),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
