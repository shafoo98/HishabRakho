import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class PayableWalletsList extends StatefulWidget {
  final String uid;
  final int walletValue;
  final int expenseValue;
  PayableWalletsList({this.uid, this.walletValue, this.expenseValue});
  @override
  _PayableWalletsListState createState() => _PayableWalletsListState();
}

class _PayableWalletsListState extends State<PayableWalletsList> {
  final String uid;
  int walletValue;
  int expenseValue;
  _PayableWalletsListState({this.uid, this.walletValue, this.expenseValue});
  @override
  Widget build(BuildContext context) {
    final payableWallets = Provider.of<List<Wallet>>(context) ?? [];
    return SingleChildScrollView(
      child: DropdownButtonFormField(
        onChanged: (value) => DatabaseService(uid: uid)
            .changeWalletValueAfterExpense(value, walletValue),
        items: payableWallets.map((wallet) {
          return DropdownMenuItem(
            onTap: () =>
                setState(() => walletValue = wallet.walletValue - expenseValue),
            value: wallet.walletId,
            child: Center(
              child: Text(
                wallet.walletName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
