import 'package:flutter/material.dart';
import './chart.dart';
import '../../models/transaction.dart';

class TransactionHeader extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionHeader(this._transactions);

  @override
  Widget build(BuildContext context) {
    print('new Item');
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'This week',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Chart(_transactions),
              SizedBox(height: 10)
            ],
          ),
        ),
        shadowColor: Colors.red,
        elevation: 5,
      ),
    );
  }
}
