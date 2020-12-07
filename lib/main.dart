import 'package:flutter/material.dart';
import './widgets/transaction/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final GlobalKey<UserTransactionState> userTransactionState =
      GlobalKey<UserTransactionState>();

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactioon App'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () => {})],
      ),
      body: SingleChildScrollView(
          child: UserTransaction(key: userTransactionState)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          userTransactionState.currentState.showTransactionFormModal(contex)
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
