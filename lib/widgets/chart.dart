import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/transaction.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;
  Chart({required this.recentTransactions});
List<Map<dynamic, dynamic>> get groupedTransactionValues{
  return List.generate(7, (index){
    final weekday = DateTime.now().subtract(Duration(days: index),);
    double totalSum = 0.0;
    for ( var i = 0; i < recentTransactions.length; i++ ){
      if (recentTransactions[i].date.day == weekday.day
          && recentTransactions[i].date.month == weekday.month
          && recentTransactions[i].date.year == weekday.year){
totalSum+= recentTransactions[i].amount;
      }
    }

    return {
      'day':DateFormat.E().format(weekday).substring(0, 1),
      'amount': totalSum
    };
  }).reversed.toList();
}

    double get spendingPercentageOfTotal {
  return groupedTransactionValues.fold(0.0, (p, e) {
return p + e['amount'];

  });
   }



  @override
  Widget build(BuildContext context) {
  print('this is testing $groupedTransactionValues');
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6.0,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:

        groupedTransactionValues.map((e){
          return Flexible(fit:FlexFit.tight ,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChartBar(
                  label: e['day'],
                  spendingAmount: e['amount'],
                  spendingPercentageOfTotal: spendingPercentageOfTotal ==0.0? 0: (
                     e['amount'] as double) /spendingPercentageOfTotal
              ),
            ),
          );
        }).toList(),

      ),

    );
  }
}
