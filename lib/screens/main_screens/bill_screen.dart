import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/add_expense_form.dart';
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
        context: context,
        builder: (context) {
          final Size size = MediaQuery.of(context).size;
          return Container(
            padding: EdgeInsets.only(top: size.height * 0.025),
            child: AddBillForm(uid: uid),
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
