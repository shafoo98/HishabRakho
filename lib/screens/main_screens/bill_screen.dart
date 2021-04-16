import 'package:flutter/material.dart';
import 'package:hishab_rakho/add_forms/add_expense_form.dart';
import 'package:hishab_rakho/list_widgets/bills_list.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class BillPage extends StatefulWidget {
  final String uid;
  BillPage({this.uid});
  @override
  _BillPageState createState() => _BillPageState(uid: uid);
}

class _BillPageState extends State<BillPage> {
  final String uid;
  _BillPageState({this.uid});
  void _addExpensePanel(String uid) {
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
              child: AddBillForm(uid: uid),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      StreamProvider<List<Bill>>.value(
        value: DatabaseService(uid: uid).bills,
        child: BillList(),
      ),
      FlatButton.icon(
        icon: Icon(Icons.add_box),
        label: Text("Add an expense"),
        onPressed: () => _addExpensePanel(uid),
      ),
    ]);
  }
}
