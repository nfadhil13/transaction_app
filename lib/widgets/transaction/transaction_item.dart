import 'package:flutter/material.dart';
import '../../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function(String id) onDelete;

  TransactionItem({@required this.transaction, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 5,
          child: Row(children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: CircleAvatar(
                        radius: 25,
                        child: FittedBox(
                          child: Text(
                            transaction.transacionInDollar,
                            style: TextStyle(color: Colors.white),
                          ),
                        )))),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    transaction.getLocalTime,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () => {onDelete(transaction.id)},
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).primaryColor)),
            )
          ])),
    );
  }
}
