import 'package:flutter/material.dart';
import 'package:untitled2/widgets/chart.dart';
import './widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.green,
      accentColor: Colors.amber,
      fontFamily: 'Quicksand',
      textTheme:ThemeData.light().textTheme.copyWith(
        subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        )),
      appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          )))
      ),
      title: 'chart',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final titleController = TextEditingController();
final amountController = TextEditingController();

  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransactions{
return _userTransaction.where((tx){
  return tx.date.isAfter(
      DateTime.now().subtract(
      Duration(days: 7),
      ),
  );
}).toList();
  }

  void _addNewTransaction(String txtitle, double txamount ){
    final newTx =Transaction(
        id:DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date:DateTime.now());

    setState((){
      _userTransaction.add(newTx);
    });
  }
  void _startAddTransaction(BuildContext ctx){
    showModalBottomSheet(
     context: context ,
      builder: (_) {
      return GestureDetector(
        child: NewTransaction(
          Press: _addNewTransaction,),
        onTap: (){},
        behavior: HitTestBehavior.opaque,
       );
},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 10.0,
        title: Text('Expenses App',), 
        actions: <Widget>[
          IconButton(splashColor: Colors.amber,
              splashRadius: 10,
              onPressed: (){_startAddTransaction(context);}, icon: Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            
            Chart(recentTransactions: _recentTransactions),


            TransactionList(transactions: _userTransaction,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(elevation: 5.0,
        autofocus: true,
onPressed: (){_startAddTransaction(context);},
child: Icon(Icons.add) ,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

    );
  }
}
