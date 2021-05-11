import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/bill.dart';

class SharedBillTile extends StatelessWidget {
  final Bill bill;
  final String uid;
  SharedBillTile({this.bill, this.uid});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 1.0,
        color: Colors.green[100],
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.height * 0.005),
        child: ListTile(
          leading: Icon(Icons.attach_money),
          title: Text(bill.billName),
          subtitle: Text("\$ " + '${bill.billValue}'),
          onTap: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text(bill.billName),
                content: Text(bill.billDescription +
                    '\n \n' +
                    'Amount: ' +
                    bill.billValue.toString()),
                elevation: 5.0,
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
