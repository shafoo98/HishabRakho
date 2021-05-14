import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/shared_budget_tile.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:provider/provider.dart';

class SharedBudgetList extends StatefulWidget {
  final String uid;
  SharedBudgetList({this.uid});
  @override
  _SharedBudgetListState createState() => _SharedBudgetListState();
}

class _SharedBudgetListState extends State<SharedBudgetList> {
  final String uid;
  _SharedBudgetListState({this.uid});
  @override
  Widget build(BuildContext context) {
    final sharedBudgets = Provider.of<List<Budget>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: sharedBudgets.length,
      itemBuilder: (context, index) {
        return SharedBudgetTile(uid: uid, budget: sharedBudgets[index]);
      },
    );
  }
}
