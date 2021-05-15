import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:hishab_rakho/pie_charts/bills_pie_chart.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class BillsOverviewPage extends StatefulWidget {
  final String uid;
  BillsOverviewPage({this.uid});
  @override
  _BillsOverviewPageState createState() => _BillsOverviewPageState(uid: uid);
}

class _BillsOverviewPageState extends State<BillsOverviewPage> {
  final String uid;
  _BillsOverviewPageState({this.uid});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Bill>>.value(
      value: DatabaseService(uid: uid).bills,
      child: BillsPieChart(uid: uid),
    );
  }
}
