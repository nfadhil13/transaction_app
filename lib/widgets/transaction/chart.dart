import 'package:flutter/material.dart';
import '../../models/dailyTransacion.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

const int DAY_IN_A_WEEK = 7;

class Chart extends StatelessWidget {
  final List<Transaction> _transactions;

  Chart(this._transactions);

  double weeklyAmount = 0;

  List<DailyTransaction> get generateDailyTransaction {
    return List.generate(DAY_IN_A_WEEK, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double dailyTotalAmount = 0;
      _transactions.forEach((element) {
        final bool isSameDay = element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year;
        if (isSameDay) {
          dailyTotalAmount += element.amount;
        }
      });
      weeklyAmount += dailyTotalAmount;
      return DailyTransaction(
          dayName: DateFormat.E().format(weekDay),
          totalAmount: dailyTotalAmount);
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: generateDailyTransaction.map((dailyTransaction) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                label: dailyTransaction.dayName,
                spendingAmount: dailyTransaction.totalAmount,
                spendingPercentage:
                    dailyTransaction.totalAmount / weeklyAmount),
          );
        }).toList(),
      ),
    );
  }
}
