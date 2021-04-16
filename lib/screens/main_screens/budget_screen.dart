import 'package:flutter/material.dart';
import 'package:hishab_rakho/add_forms/add_budget_form.dart';
import 'package:hishab_rakho/list_widgets/budget_list.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  final String uid;
  BudgetPage({this.uid});
  @override
  _BudgetPageState createState() => _BudgetPageState(uid: uid);
}

class _BudgetPageState extends State<BudgetPage> {
  final String uid;
  _BudgetPageState({this.uid});
  void _addBudgetPanel(String uid) {
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
              child: AddBudgetForm(uid: uid),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      StreamProvider<List<Budget>>.value(
        value: DatabaseService(uid: uid).budgets,
        child: BudgetList(),
      ),
      FlatButton.icon(
        icon: Icon(Icons.add_box),
        label: Text("Add a Budget"),
        onPressed: () => _addBudgetPanel(uid),
      ),
    ]);
  }
}
