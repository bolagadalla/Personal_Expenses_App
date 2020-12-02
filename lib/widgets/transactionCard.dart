import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      // Container to give me margine
      child: Row(
        children: [
          // Column to give me icon and amount under it
          Column(
            children: [
              Container(
                child: Icon(
                  Icons.attach_money,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
                margin: EdgeInsets.only(top: 5),
              ),
              // Container for the Price text
              Container(
                child: Text(
                  "\$${transaction.amountSpent.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
                padding: EdgeInsets.all(8),
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
          // Column for the title and date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container to give me margin for title
              Text(
                transaction.title,
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
              // Date with text interplation
              Text(
                DateFormat("yMMMd").format(transaction.date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
