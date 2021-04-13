import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/user.dart';
import 'package:hishab_rakho/screens/main_screens/bill_screen.dart';
import 'package:hishab_rakho/screens/main_screens/budget_screen.dart';
import 'package:hishab_rakho/screens/main_screens/settings_screen.dart';
import 'package:hishab_rakho/screens/main_screens/overview.dart';
import 'package:hishab_rakho/screens/main_screens/wallets_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(73, 118, 185, 1.0),
          title: Text('Hishabh Rakho'),
          bottom: TabBar(
            indicatorColor: Colors.blueGrey[100],
            tabs: [
              Tab(
                child: Text(
                  "Overview",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.donut_small),
              ), //overview
              Tab(
                child: Text(
                  "Wallet",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.account_balance_wallet),
              ), //wallet
              Tab(
                child: Text(
                  "Bills",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.receipt),
              ), //bills
              Tab(
                child: Text(
                  "Budgets",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.payment),
              ), //budgtes
              Tab(
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.settings),
              ), //settings
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Overview(),
            WalletPage(uid: user.uid),
            BillPage(uid: user.uid),
            BudgetPage(uid: user.uid),
            Settings(),
          ],
        ),
      ),
    );
  }
}
