import 'package:flutter/material.dart';

// We need this to be StatefulWidget so that when we type something into
// The overlay, it wouldnt automatically clears it.
class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;

  AddTransaction(this.addNewTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submittedData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : 0.00;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      // NEED TO CREATE AN ERROR HANDLER TO DISPLAY TO USER
      print("Inproper field");
      return;
    }

    // Gives us access to the variables in the super class
    widget.addNewTransaction(
      title: enteredTitle,
      amount: enteredAmount,
    ); // Add Transaction

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submittedData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              // keyboardType: TextInputType.number, since we need decimal on iOS we need the follwong:
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => submittedData(),
            ),
            FlatButton(
              onPressed: submittedData,
              child: Text("Add Transaction"),
              textColor: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
