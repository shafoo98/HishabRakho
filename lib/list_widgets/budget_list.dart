import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/budget_tile.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:provider/provider.dart';

class BudgetList extends StatefulWidget {
  final String uid;
  BudgetList({this.uid});
  @override
  _BudgetListState createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  final String uid;
  _BudgetListState({this.uid});
  @override
  Widget build(BuildContext context) {
    final budgets = Provider.of<List<Budget>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: budgets.length,
      itemBuilder: (context, index) {
        return BudgetTile(budget: budgets[index]);
      },
    );
  }
}
