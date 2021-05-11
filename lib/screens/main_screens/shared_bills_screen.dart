import 'package:flutter/material.dart';
import 'package:hishab_rakho/list_widgets/shared_bills_list.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:hishab_rakho/services/database.dart';
import 'package:provider/provider.dart';

class SharedBillPage extends StatefulWidget {
  final String uid;
  SharedBillPage({this.uid});
  @override
  _SharedBillPageState createState() => _SharedBillPageState(uid: uid);
}

class _SharedBillPageState extends State<SharedBillPage> {
  final String uid;
  _SharedBillPageState({this.uid});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      StreamProvider<List<Bill>>.value(
        value: DatabaseService(uid: uid).sharedBills,
        child: SharedBillList(uid: uid),
      ),
    ]);
  }
}
