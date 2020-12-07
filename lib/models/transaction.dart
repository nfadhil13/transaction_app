import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({this.id, this.title, this.amount, DateTime dateTime})
      : this.date = dateTime ?? DateTime.now();

  String get getLocalTime {
    return DateFormat.yMMMd().format(date);
  }

  String get transacionInDollar {
    return '\$${amount.toStringAsFixed(2)}';
  }
}
