import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/bill_tile.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:provider/provider.dart';

class BillList extends StatefulWidget {
  @override
  _BillListState createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    final bills = Provider.of<List<Bill>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: bills.length,
      itemBuilder: (context, index) {
        return BillTile(bill: bills[index]);
      },
    );
  }
}
