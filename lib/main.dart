import 'package:flutter/material.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amountSpent: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "New Pants",
      amountSpent: 19.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Personal Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Container(
              child: Text("CHART!"),
              width: double.infinity,
              margin: EdgeInsets.all(20),
            ),
            color: Colors.blue,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 12),
          ),
          Column(
            children: transactions.map((tx) {
              // The transaction Card
              return Card(
                // Container to give me margine
                child: Container(
                  // Row for icon and title with date
                  child: Row(
                    children: [
                      // Column to give me icon and amount under it
                      Column(
                        children: [
                          Container(
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.green,
                              size: 32,
                            ),
                            margin: EdgeInsets.only(top: 5),
                          ),
                          Container(
                            child: Text(
                              "\$" + tx.amountSpent.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
                          )
                        ],
                      ),
                      // Column for the title and date
                      Column(
                        children: [
                          // Container to give me margin for title
                          Container(
                            child: Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          ),
                          // Date with text interplation
                          Text(tx.date.month.toString() +
                              "-" +
                              tx.date.day.toString() +
                              "-" +
                              tx.date.year.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                color: Colors.white12,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
