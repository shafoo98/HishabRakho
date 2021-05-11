import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hishab_rakho/edit_forms/edit_bill_form.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:hishab_rakho/services/database.dart';

class BillTile extends StatelessWidget {
  final Bill bill;
  final String uid;
  BillTile({this.bill, this.uid});

  void _editBillPanel(String billId, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: EditBillForm(
                uid: uid,
                billId: bill.billId,
              ),
            ),
          );
        });
  }

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
              onTap: () =>
                  DatabaseService(uid: uid).changeIsShared(bill.billId),
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () =>
                  DatabaseService(uid: uid).deleteBillData(bill.billId),
            ),
            IconSlideAction(
              caption: 'Edit',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () {
                _editBillPanel(bill.billId, context);
              },
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
