import 'package:flutter/material.dart';
import 'package:hishab_rakho/services/database.dart';

class AddBudgetForm extends StatefulWidget {
  final String uid;
  AddBudgetForm({this.uid});
  @override
  _AddBudgetFormState createState() => _AddBudgetFormState(uid: uid);
}

class _AddBudgetFormState extends State<AddBudgetForm> {
  final String uid;
  _AddBudgetFormState({this.uid});
  final _formKey = GlobalKey<FormState>();

  String _budgetName;
  String _budgetDescription;
  int _budgetValue;
  DateTime _dateAdded = DateTime.now();
  String error = '';

  @override
  Widget build(BuildContext context) {
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
              'Add a budget here',
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
              hintText: 'Name of budget',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
            ),
            validator: (value) =>
                value.isEmpty ? 'Please enter a name' + ' for budget' : null,
            onChanged: (value) {
              setState(() {
                _budgetName = value;
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
                hintText: 'Describe your budget in details',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
              ),
              validator: (value) => value.isEmpty
                  ? 'Please enter a description' + ' for budget'
                  : null,
              onChanged: (value) {
                setState(() {
                  _budgetDescription = value;
                });
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.monetization_on),
              hintText: 'Enter the amount of your budget',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
            ),
            validator: (value) =>
                value.isEmpty ? 'Please enter an amount' + ' for budget' : null,
            onChanged: (value) {
              setState(() {
                _budgetValue = int.parse(value);
              });
            },
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                dynamic result = await _dbService.addUserBudgetsData(
                    _budgetName,
                    _budgetDescription,
                    _budgetValue,
                    _dateAdded,
                    uid);
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
              'Add Budget',
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
