import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class PayableWalletsList extends StatefulWidget {
  final String uid;
  final int expenseValue;
  PayableWalletsList({this.uid, this.expenseValue});
  @override
  _PayableWalletsListState createState() =>
      _PayableWalletsListState(uid: uid, expenseValue: expenseValue);
}

class _PayableWalletsListState extends State<PayableWalletsList> {
  final String uid;
  int walletValue;
  final int expenseValue;
  _PayableWalletsListState({this.uid, this.expenseValue});
  @override
  Widget build(BuildContext context) {
    final payableWallets = Provider.of<List<Wallet>>(context) ?? [];
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_balance_wallet),
                hintText: 'Choose the wallet to pay with',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
              ),
              onChanged: (value) {
                DatabaseService(uid: uid)
                    .changeWalletValueAfterExpense(value, walletValue);
              },
              items: payableWallets.map((wallet) {
                return DropdownMenuItem(
                  onTap: () => walletValue = wallet.walletValue - expenseValue,
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
          ),
        ],
      ),
    );
  }
}
