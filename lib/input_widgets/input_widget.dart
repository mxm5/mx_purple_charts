import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/transaction.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class InputWidget extends StatefulWidget {
  final Function addTransaction;

  InputWidget({this.addTransaction});

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submitTrnxn() {
    var amount = double.parse(amountInputController.text);
    var title = titleInputController.text;

    if (amount <= 0 ||
        title.isEmpty ||
        amount > 1000000000 ||
        _selectedDate == null) {
      return;
    }

    widget.addTransaction(
      Transaction(
          amount: amount,
          date: _selectedDate,
          id: DateTime.now().toString(),
          title: title),
    );
    Navigator.of(context).pop();
  }

  DateTime _selectedDate;

  void xyz() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
      });
    });
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
          SizedBox(
            height: 14,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'no date chosen'
                      : 'date chosen : ${DateFormat.yMd().format(_selectedDate)}',
                  style: _selectedDate == null
                      ? Theme.of(context).textTheme.subtitle
                      : Theme.of(context).textTheme.subtitle.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                  textAlign: TextAlign.center,
                ),
              ),
              FlatButton(
                color: Theme.of(context).primaryColorLight.withAlpha(100),
                onPressed: xyz,
                child: Text(
                  'select date',
                  style: Theme.of(context).textTheme.button,
                ),
              )
            ],
          ),
          FlatButton(
              color: Theme.of(context).primaryColorLight.withAlpha(100),
              onPressed: submitTrnxn,
              child: Text(
                'add items',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
