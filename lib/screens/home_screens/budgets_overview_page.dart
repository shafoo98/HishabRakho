import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:hishab_rakho/pie_charts/budgets_pie_chart.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class BudgetsOverviewPage extends StatefulWidget {
  final String uid;
  BudgetsOverviewPage({this.uid});
  @override
  _BudgetsOverviewPageState createState() =>
      _BudgetsOverviewPageState(uid: uid);
}

class _BudgetsOverviewPageState extends State<BudgetsOverviewPage> {
  final String uid;
  _BudgetsOverviewPageState({this.uid});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Budget>>.value(
      value: DatabaseService(uid: uid).budgets,
      child: BudgetsPieChart(uid: uid),
    );
  }
}
