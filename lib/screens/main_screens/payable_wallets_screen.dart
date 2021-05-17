import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class PayableWalletsPage extends StatefulWidget {
  final String uid;
  final int expenseValue;
  PayableWalletsPage({this.uid, this.expenseValue});
  @override
  _PayableWalletsPageState createState() =>
      _PayableWalletsPageState(uid: uid, expenseValue: expenseValue);
}

class _PayableWalletsPageState extends State<PayableWalletsPage> {
  final String uid;
  final int expenseValue;
  _PayableWalletsPageState({this.uid, this.expenseValue});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Wallet>>.value(
      value: DatabaseService(uid: uid).wallets,
      child: Text(expenseValue.toString()),
    );
  }
}
