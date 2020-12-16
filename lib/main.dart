import 'dart:math';
import 'package:grocery_app_flutter/input_widgets/list_state.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              ListOfItems(),
            ],
          ),
        ),
      ),
    );
  }
}
