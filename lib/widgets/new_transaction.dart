

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final dynamic Press;


  NewTransaction({required this.Press});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit(){
    final entTitle = titleController.text;
    final entAmount = double.parse(amountController.text);
    if (entTitle.isEmpty || entAmount <=0){
return;
    }
    widget.Press(
        entTitle,
        entAmount
    );
Navigator.of(context).pop();
  }

  void presentDatePicker(){
showDatePicker(context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2021),
    lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all((10.0)),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.end,
          children :<Widget> [
            TextField(
                autofocus: true,
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
            onSubmitted:(_){
              submit();
            }
         ),

            TextField(
                autofocus: true,
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountController,
            keyboardType: TextInputType.number ,
                onSubmitted:(_){
                  submit();
                }),

            Container(
              height: 70.0,
              child: Row(
                children: [
                  Text('no date chosen'),
                  FlatButton(
                    onPressed: (){

                    },
                    child: Text('select date'),
                  )
                ],
              ),
            ),

            FlatButton( child: Text('add transactions'),
              textColor: Colors.green,
              onPressed: (){
              submit();

              },
            ),

          ],

        ),
      ),
    );

  }
}
