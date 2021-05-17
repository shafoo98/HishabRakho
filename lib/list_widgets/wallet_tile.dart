import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hishab_rakho/edit_forms/edit_wallet_form.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:hishab_rakho/services/database.dart';

class WalletTile extends StatelessWidget {
  final Wallet wallet;
  final String uid;
  WalletTile({this.wallet, this.uid});

  void _editWalletPanel(String walletId, BuildContext context) {
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
              child: EditWalletForm(
                uid: uid,
                walletId: wallet.walletId,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 5.0,
        color: Colors.blue[50],
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.height * 0.005),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 1 / 4,
          actions: [
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () =>
                  DatabaseService(uid: uid).deleteWalletData(wallet.walletId),
            ),
            IconSlideAction(
              caption: 'Edit',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () {
                _editWalletPanel(wallet.walletId, context);
              },
            ),
          ],
          child: ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text(wallet.walletName),
            subtitle: Text("\$ " + '${wallet.walletValue}'),
            onTap: () {
              showDialog(
                context: context,
                child: AlertDialog(
                  title: Text(wallet.walletName),
                  content: Text(wallet.walletDescription +
                      '\n \n' +
                      'Amount: ' +
                      wallet.walletValue.toString()),
                  elevation: 5.0,
                  actions: [
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
