import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/user.dart';
import 'package:hishab_rakho/screens/main_screens/bill_screen.dart';
import 'package:hishab_rakho/screens/main_screens/budget_screen.dart';
import 'package:hishab_rakho/screens/main_screens/settings_screen.dart';
import 'package:hishab_rakho/screens/main_screens/overview.dart';
import 'package:hishab_rakho/screens/main_screens/shared_bills_screen.dart';
import 'package:hishab_rakho/screens/main_screens/shared_budget_screen.dart';
import 'package:hishab_rakho/screens/main_screens/wallets_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(73, 118, 185, 1.0),
          title: Text('Hishabh Rakho'),
          bottom: TabBar(
            indicatorColor: Colors.blueGrey[100],
            tabs: [
              Tab(
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 7.0, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.donut_small),
              ), //overview
              Tab(
                child: Text(
                  "Wallets",
                  style: TextStyle(fontSize: 7.0, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.account_balance_wallet),
              ), //wallet
              Tab(
                child: Text(
                  "Bills",
                  style: TextStyle(fontSize: 7.0, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.receipt),
              ), //bills
              Tab(
                child: Text(
                  "Budgets",
                  style: TextStyle(fontSize: 6.3, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.payment),
              ),
              Tab(
                child: Text(
                  "Bills Leaderboard",
                  style: TextStyle(fontSize: 7.0, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.folder_shared),
              ),
              Tab(
                child: Text(
                  "Budgets Leaderboard",
                  style: TextStyle(fontSize: 6.3, fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.folder_shared),
              ),
              //budgets
              Tab(
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 6.3, fontWeight: FontWeight.bold),
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
            SharedBillPage(uid: user.uid),
            SharedBudgetPage(uid: user.uid),
            Settings(),
          ],
        ),
      ),
    );
  }
}
