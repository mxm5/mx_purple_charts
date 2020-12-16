import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/transaction.dart';

class InputWidget extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  final Function addTransaction;

  InputWidget({this.addTransaction});

  void submitTrnxn() {
    var amount = double.parse(amountInputController.text);
    var title = titleInputController.text;

    if (amount <= 0 || title.isEmpty || amount > 1000000000) {
      return;
    }

    addTransaction(Transaction(
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: title));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleInputController,
            onSubmitted: (_) => submitTrnxn(),
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              labelText: 'title',
            ),
          ),
          TextField(
            cursorColor: Colors.purple,
            controller: amountInputController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitTrnxn(),
            decoration: InputDecoration(
              labelText: 'amount',
            ),
          ),
          Container(
            margin: EdgeInsets.all(7),
            color: Colors.purple[50],
            child: FlatButton(
                onPressed: submitTrnxn,
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
