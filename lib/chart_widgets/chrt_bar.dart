import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar({this.label, this.spendingAmount, this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: LayoutBuilder(builder: (context, constrains) {
          return Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor.withAlpha(30),
                height: constrains.maxHeight * 0.115,
                child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
                ),
              ),
              SizedBox(
                height: constrains.maxHeight * 0.04,
              ),
              Container(
                width: 10,
                height: constrains.maxHeight * 0.7,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 220, 220, 1),
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: constrains.maxHeight * 0.115,
                  child: FittedBox(child: Text(label)))
            ],
          );
        }));
  }
}
