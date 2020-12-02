import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerctOfTotal;

  ChartBar({
    this.label,
    this.spendingAmount,
    this.spendingPerctOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 20,
          child: Icon(
            Icons.attach_money,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // Forces the child into its valiable space, if its a text it will shrink the text
        Container(
          height: 20,
          child: FittedBox(
            child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 80,
          width: 10,
          // Stack will stack widget ontop of each other, the first being at the bottom
          child: Stack(
            children: [
              // Background container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // This will make a box with a size that has a certain fraction of its parent widget size
              // from 0 - 1, 1 being completely equal to the parent size
              FractionallySizedBox(
                heightFactor: spendingPerctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
