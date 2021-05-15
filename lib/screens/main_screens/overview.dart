import 'package:flutter/material.dart';
import 'package:hishab_rakho/screens/home_screens/bills_overview_page.dart';
import 'package:hishab_rakho/screens/home_screens/budgets_overview_page.dart';
import 'package:hishab_rakho/screens/home_screens/wallets_overview_page.dart';

class Overview extends StatefulWidget {
  final String uid;
  Overview({this.uid});
  @override
  _OverviewState createState() => _OverviewState(uid: uid);
}

class _OverviewState extends State<Overview> {
  final String uid;
  _OverviewState({this.uid});
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: <Widget>[
        Center(
          child: WalletsOverviewPage(),
        ),
        Center(
          child: BillsOverviewPage(),
        ),
        Center(
          child: BudgetsOverviewPage(),
        ),
      ],
    );
  }
}
