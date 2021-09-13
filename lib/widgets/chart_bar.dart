 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;
  const ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.spendingPercentageOfTotal});
  @override
  Widget build(BuildContext context) {



    return Column( children: [
      Container(
          height: 20,
          child: FittedBox(
          child: Text('\$$spendingAmount')
      )
      ),
      SizedBox(height: 4.0,),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                 border: Border.all(
                     color:Colors.grey,
                 width:1.0 ),
                color: Color.fromRGBO(
                    220, 220, 220, 0.8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(heightFactor: spendingPercentageOfTotal,
            child: Container(
              decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
  ),
  ),
            )
          ]
        ),
      ),
      SizedBox(height: 4.0,),
      Text(label)
    ],);
  }
}
