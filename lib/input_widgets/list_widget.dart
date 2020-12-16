import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class ListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  ListWidget({this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (cx, i) {
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
                    '\$' + transactions[i].amount.toString(),
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
                      transactions[i].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(transactions[i].date),
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w100),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
