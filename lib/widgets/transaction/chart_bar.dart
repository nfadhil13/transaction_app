import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar({this.label, this.spendingAmount, this.spendingPercentage});

  String doubleToDollar(double theDouble) {
    return '\$${theDouble.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 12,
          child: FittedBox(
            child: Text(
              doubleToDollar(spendingAmount),
              style: TextStyle(fontSize: 10, fontFamily: 'JetBrainsMono'),
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400])),
              FractionallySizedBox(
                  heightFactor: spendingPercentage,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor))),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 10, fontFamily: 'JetBrainsMono'),
        )
      ],
    );
  }
}
