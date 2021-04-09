import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/wallet_list.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:hishab_rakho/list_widgets/add_wallet_form.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  final String uid;
  WalletPage({this.uid});
  @override
  _WalletPageState createState() => _WalletPageState(uid: uid);
}

class _WalletPageState extends State<WalletPage> {
  final String uid;
  _WalletPageState({this.uid});
  void _addWalletPanel(String uid) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final Size size = MediaQuery.of(context).size;
          return Container(
            padding: EdgeInsets.only(top: size.height * 0.025),
            child: AddWalletForm(uid: uid),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      StreamProvider<List<Wallet>>.value(
        value: DatabaseService(uid: uid).wallets,
        child: WalletList(),
      ),
      FlatButton.icon(
        icon: Icon(Icons.add_box),
        label: Text("Add a wallet"),
        onPressed: () => _addWalletPanel(uid),
      ),
    ]);
  }
}
