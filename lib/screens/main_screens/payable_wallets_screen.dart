import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/payable_wallets_list.dart';
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

  _showWalletsSheet({int expenseValue, String uid}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: PayableWalletsList(
                uid: uid,
                expenseValue: expenseValue,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Wallet>>.value(
      value: DatabaseService(uid: uid).wallets,
      child: _showWalletsSheet(uid: uid, expenseValue: expenseValue),
    );
  }
}
