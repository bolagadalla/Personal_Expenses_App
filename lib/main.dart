import 'package:flutter/material.dart';

import './widgets/addTransaction.dart';
import './widgets/transactionList.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.purple[900],
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

// Since we want to show an overlay window, then we need a new class with
// Its own context so that we can only use the body rather then the whole page
// Otherwise it wont show the overlay
// So whenever we need to have an overlay, then we must create a new class for it to be within
// Also it needs to be stateful widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // The list of transactions
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    // Gives only elements where a certain condition is met
    return _transactions.where((element) {
      // Return the elements that their date is after today - 7 days.
      // i.e. if today was monday gives any element that was made after last monday
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  // Adds a new transcation to the list of transactions
  void _addNewTransaction({String title, double amount, DateTime date}) {
    final newTrans = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amountSpent: amount,
      date: date,
    );

    // rebuild the widgets to reflect the addiction of the transaction
    setState(() {
      _transactions.add(newTrans);
    });
  }

  void _startAddNewTransactions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        // This will catch the tap within the overlay to not allow it to close automatically
        return GestureDetector(
          child: AddTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Personal Expenses",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransactions(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(_recentTransactions),
          TransactionList(_transactions, _deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransactions(context);
        },
      ),
    );
  }
}
