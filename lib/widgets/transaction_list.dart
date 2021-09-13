import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList  extends StatelessWidget {
final List<Transaction> transactions;
TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:transactions.isEmpty? Column(children: <Widget>[

        Text('no transaction',
          style: Theme.of(context).textTheme.subtitle1,),
        SizedBox(height: 10,),
        Container(height: 200,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover, ))
      ]) : ListView.builder(
        itemBuilder: (ctx, index){
          return  Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6
            ) ,
            child: ListTile(leading: CircleAvatar(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',

                        ),
                ),
              ),

              radius: 30,),
              title:  Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
              subtitle:          Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

            ),
          );

        // return Card(
        //   child: Row(
        //     children: <Widget>[
        //       Container(
        //         margin: EdgeInsets.symmetric(
        //           vertical: 10,
        //           horizontal: 15,
        //         ),
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Theme.of(context).primaryColor,
        //             width: 2,
        //           ),
        //         ),
        //         padding: EdgeInsets.all(10),
        //         child: Text(
        //           '\$${transactions[index].amount.toStringAsFixed(2)}',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20,
        //             color: Theme.of(context).primaryColorDark,
        //           ),
        //         ),
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Text(
        //             '${transactions[index].title}',
        //             style: Theme.of(context).textTheme.subtitle1,
        //           ),
        //           Text(
        //             DateFormat.yMMMd().format(transactions[index].date),
        //             style: TextStyle(
        //               color: Colors.grey,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // );
      },
      itemCount: transactions.length,)
    );
  }
}



