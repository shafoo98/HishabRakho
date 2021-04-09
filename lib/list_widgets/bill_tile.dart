import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hishab_rakho/models/bill.dart';

class BillTile extends StatelessWidget {
  final Bill bill;
  BillTile({this.bill});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 5.0,
        color: Colors.blue[50],
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.height * 0.005),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 1 / 4,
          actions: [
            IconSlideAction(
              caption: 'Share',
              color: Colors.white,
              icon: Icons.share,
              onTap: () => print("Shared"),
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => print('Deleted'),
            ),
            IconSlideAction(
              caption: 'Edit',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => print("Edit"),
            ),
          ],
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
      ),
    );
  }
}
