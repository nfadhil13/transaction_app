import 'package:flutter/material.dart';
import './transaction_list.dart';
import './transaction_form.dart';
import './transaction_header.dart';
import '../../models/transaction.dart';
import './EmptyTransaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  UserTransactionState createState() => UserTransactionState();
}

class UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(id: '1', title: 'Judul 1', amount: 20),
    Transaction(id: '2', title: 'Judul 3', amount: 30),
    Transaction(
        id: '3',
        title: 'Judul 3',
        amount: 30,
        dateTime: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: '3',
        title: 'Judul 3',
        amount: 150,
        dateTime: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: '3',
        title: 'Judul 3',
        amount: 50.32,
        dateTime: DateTime.now().subtract(Duration(days: 4)))
  ];

  void showTransactionFormModal(BuildContext ctx) {
    print('launching');
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        });
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    print(title);
    setState(() {
      _transactions.add(Transaction(
          id: DateTime.now().toIso8601String(),
          title: title,
          amount: amount,
          dateTime: date));
    });
    Navigator.of(context).pop();
  }

  void _deleteItem(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _transactions.isEmpty
              ? EmptyList(
                  emptyImage: 'assets/images/waiting.png',
                  message: 'You have no transaction history')
              : TransactionHeader(_transactions),
          TransactionList(transaction: _transactions, onDelete: _deleteItem)
        ],
      ),
    );
  }
}
