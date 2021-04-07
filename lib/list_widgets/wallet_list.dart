import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/wallet_tile.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:provider/provider.dart';

class WalletList extends StatefulWidget {
  @override
  _WalletListState createState() => _WalletListState();
}

class _WalletListState extends State<WalletList> {
  @override
  Widget build(BuildContext context) {
    final wallets = Provider.of<List<Wallet>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: wallets.length,
      itemBuilder: (context, index) {
        return WalletTile(wallet: wallets[index]);
      },
    );
  }
}
