import 'package:flutter/material.dart';
import 'package:hishab_rakho/screens/home_screens/settings_screen.dart';
import 'package:hishab_rakho/screens/home_screens/overview.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Hishabh Rakho'),
          bottom: TabBar(
            indicatorColor: Color.fromRGBO(200, 255, 0, 1),
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
            Icon(Icons.account_balance_wallet),
            Icon(Icons.receipt),
            Icon(Icons.payment),
            Settings(),
          ],
        ),
      ),
    );
  }
}
