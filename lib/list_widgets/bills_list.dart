import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/bill_tile.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:provider/provider.dart';

class BillList extends StatefulWidget {
  final String uid;
  BillList({this.uid});
  @override
  _BillListState createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  final String uid;
  _BillListState({this.uid});
  @override
  Widget build(BuildContext context) {
    final bills = Provider.of<List<Bill>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: bills.length,
      itemBuilder: (context, index) {
        return BillTile(uid: uid, bill: bills[index]);
      },
    );
  }
}
