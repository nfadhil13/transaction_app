import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(String title, double amount, DateTime date) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  DateTime _pickedDateTime;

  String get dateString {
    return DateFormat.yMMMd().format(_pickedDateTime);
  }

  void showTheDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      print(value);
      setState(() {
        _pickedDateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild transaction form');
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(_pickedDateTime == null
                          ? 'You havent picked the date'
                          : dateString)),
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () => {showTheDatePicker()},
                          child: Text(
                            'Pick date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () => {
                          widget.onSubmit(
                              titleController.text,
                              double.parse(amountController.text),
                              _pickedDateTime)
                        },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
