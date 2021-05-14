import 'package:flutter/material.dart';
import 'package:hishab_rakho/add_forms/add_expense_form.dart';
import 'package:hishab_rakho/list_widgets/bills_list.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:hishab_rakho/pie_charts/wallets_pie_chart.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class WalletsOverviewPage extends StatefulWidget {
  final String uid;
  WalletsOverviewPage({this.uid});
  @override
  _WalletsOverviewPageState createState() =>
      _WalletsOverviewPageState(uid: uid);
}

class _WalletsOverviewPageState extends State<WalletsOverviewPage> {
  final String uid;
  _WalletsOverviewPageState({this.uid});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Wallet>>.value(
      value: DatabaseService(uid: uid).wallets,
      //child: WalletsPieChart(uid: uid),
    );
  }
}
