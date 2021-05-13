import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hishab_rakho/screens/main_screens/payable_wallets_screen.dart';
import 'package:hishab_rakho/services/database.dart';

class AddBillForm extends StatefulWidget {
  final String uid;
  AddBillForm({this.uid});
  @override
  _AddBillFormState createState() => _AddBillFormState(uid: uid);
}

class _AddBillFormState extends State<AddBillForm> {
  final String uid;
  _AddBillFormState({this.uid});
  final _formKey = GlobalKey<FormState>();
  String _billName;
  String _billDescription;
  int billValue;
  DateTime _dateAdded = DateTime.now();
  bool _isShared = false;
  String error = '';
  String createCryptoRandomString(int len) {
    final Random _random = Random.secure();
    var values = List<int>.generate(len, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }

  @override
  Widget build(BuildContext context) {
    String _billId = createCryptoRandomString(6);
    final Size size = MediaQuery.of(context).size;
    final DatabaseService _dbService = DatabaseService();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              'Add an expense here',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          TextFormField(
            maxLength: 50,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.edit),
              hintText: 'Name of expense or bill',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
            ),
            validator: (value) => value.isEmpty
                ? 'Please enter a name' + ' for bill or expense'
                : null,
            onChanged: (value) {
              setState(() {
                _billName = value;
              });
            },
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          SizedBox(
            height: size.height * 0.15,
            child: TextFormField(
              maxLength: 250,
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit),
                hintText: 'Describe your bill or expense in details',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
              ),
              validator: (value) => value.isEmpty
                  ? 'Please enter a description' + ' for bill or expense'
                  : null,
              onChanged: (value) {
                setState(() {
                  _billDescription = value;
                });
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.monetization_on),
              hintText: 'Enter the amount of your bill or expense',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
            ),
            validator: (value) => value.isEmpty
                ? 'Please enter an amount' + ' for bill or expense'
                : null,
            onChanged: (value) {
              setState(() {
                billValue = int.parse(value);
              });
            },
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          PayableWalletsPage(
            uid: uid,
            expenseValue: billValue,
          ),
          SizedBox(
            height: size.height * 0.0025,
          ),
          RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                dynamic result = await _dbService.addUserBillsData(
                    _billName,
                    _billDescription,
                    billValue,
                    _dateAdded,
                    uid,
                    _billId,
                    _isShared);
                if (result == null) {
                  setState(() {
                    error = "Something went wrong";
                  });
                }
                Navigator.of(context).pop();
              }
            },
            elevation: 5.0,
            child: Text(
              'Add Expense',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  color: Colors.black45),
            ),
            color: Colors.grey[200],
          ),
          SizedBox(
            height: size.height * 0.005,
            child: Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
