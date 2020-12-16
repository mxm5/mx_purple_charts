import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/transaction.dart';

class InputWidget extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  final Function addTransaction;

  InputWidget({this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  addTransaction(Transaction(
                      amount: double.parse(amountInputController.text),
                      date: DateTime.now(),
                      id: DateTime.now().toString(),
                      title: titleInputController.text));
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
    );
  }
}
