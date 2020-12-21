import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/chart_widgets/chrt_bar.dart';
import 'package:grocery_app_flutter/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  // in here I want a list [ ] of maps [ { '' , {} } ]
  final List<Transaction> resentTransactionList;
  //{@required this.amount,
  // @required this.date,
  // @required this.id,
  // @required this.title});
  Chart({this.resentTransactionList});
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // this gets the data for last 7 days man
      // so we subtract from one to seven like a loop
      // to check dates in the dates of transactions
      //
      final lastWeekDay = DateTime.now().subtract(Duration(days: index));
      // so this is the week day part in the  chart
      // but since week day is the thing with so many props and methods
      // we use intl package in the text generator
      //
      // now we have to make amount part since amounts are not clean we need
      // to loop throgh it to understand how much spending happend that day
      // in that year and in that month but different hours
      var thatDaySum = 0.0;
      resentTransactionList.forEach((tx) {
        if (tx.date.day == lastWeekDay.day &&
            tx.date.month == lastWeekDay.month &&
            tx.date.year == lastWeekDay.year) {
          thatDaySum += tx.amount;
        }
        return;
      });
      //
      // return {'day': 'S', 'amount': 9.99};
      // return {'day': 'Transaction.date', 'amount': 'transaction.amount'};

      // print(DateFormat.E().format(lastWeekDay));
      // print(thatDaySum.toStringAsFixed(2));
      return {
        'day': DateFormat.E().format(
            lastWeekDay)[0], //substring(0,1) -> not Strin bur strin little s
        'amount': thatDaySum
      };
    });
  }

  double get weeksWholeSpending {
    return groupedTransactionValues.fold(0.0, (sum, element) {
      return sum += element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(
        20,
      ),
      child: Row(
        children: groupedTransactionValues.map((e) {
          return ChartBar(
            label: e['day'],
            spendingAmount: (e['amount'] as double),
            spendingPctOfTotal: (e['amount'] as double) / weeksWholeSpending,
          );
        }).toList(),
      ),
    );
  }
}
