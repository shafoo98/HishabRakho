import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/shared_bill_tile.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:provider/provider.dart';

class SharedBillList extends StatefulWidget {
  final String uid;
  SharedBillList({this.uid});
  @override
  _SharedBillListState createState() => _SharedBillListState();
}

class _SharedBillListState extends State<SharedBillList> {
  final String uid;
  _SharedBillListState({this.uid});
  @override
  Widget build(BuildContext context) {
    final sharedBills = Provider.of<List<Bill>>(context) ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: sharedBills.length,
      itemBuilder: (context, index) {
        return SharedBillTile(uid: uid, bill: sharedBills[index]);
      },
    );
  }
}
