import 'package:flutter/material.dart';
import '../../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = List<Transaction>();
  final Function(String id) onDelete;

  TransactionList({List<Transaction> transaction, this.onDelete}) {
    transaction.forEach((element) {
      this.transactions.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions[index],
                onDelete: onDelete,
              );
            },
            itemCount: transactions.length));
  }
}
