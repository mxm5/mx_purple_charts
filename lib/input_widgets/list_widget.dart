import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

class ListWidget extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeHandeler;

  // - assets/images/empty-512.webp
  // - assets/images/waiting-icon-gif-23.jpg
  // - assets/images/waitingInf.gif

  ListWidget({this.transactions, this.removeHandeler});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'nothing added here',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 240,
                child: Image.asset(
                  'assets/images/waiting-icon-gif-23.jpg',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemBuilder: (cx, i) {
              // '\$' + transactions[i].amount.toStringAsFixed(2),
              // transactions[i].title,
              // DateFormat.yMMMEd().format(transactions[i].date),
              return Card(
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FittedBox(
                        child: Text(
                          '\$' + transactions[i].amount.toStringAsFixed(2),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[i].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(transactions[i].date),
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever_outlined,
                      ),
                      onPressed: () {
                        removeHandeler(uid: transactions[i].id);
                      }),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
