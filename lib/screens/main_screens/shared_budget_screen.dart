import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:hishab_rakho/screens/main_screens/shared_budget_list.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class SharedBudgetPage extends StatefulWidget {
  final String uid;
  SharedBudgetPage({this.uid});
  @override
  _SharedBudgetPageState createState() => _SharedBudgetPageState(uid: uid);
}

class _SharedBudgetPageState extends State<SharedBudgetPage> {
  final String uid;
  _SharedBudgetPageState({this.uid});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      StreamProvider<List<Budget>>.value(
        value: DatabaseService(uid: uid).sharedBudgets,
        child: SharedBudgetList(uid: uid),
      ),
    ]);
  }
}
