import 'package:flutter/material.dart';

class AddWalletForm extends StatefulWidget {
  @override
  _AddWalletFormState createState() => _AddWalletFormState();
}

class _AddWalletFormState extends State<AddWalletForm> {
  final _formKey = GlobalKey<FormState>();

  String _walletName;
  String _walletDescription;
  int _walletValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Add a wallet here',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          TextFormField(
            maxLength: 50,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.edit),
              hintText: 'Name of wallet or account',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
            ),
            validator: (value) => value.isEmpty
                ? 'Please enter a name' + 'for wallet or account'
                : null,
            onChanged: (value) {
              setState(() {
                _walletName = value;
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
                hintText: 'Describe your wallet or account in details',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
              ),
              validator: (value) => value.isEmpty
                  ? 'Please enter a description' + 'for wallet or account'
                  : null,
              onChanged: (value) {
                setState(() {
                  _walletDescription = value;
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
              hintText: 'Enter the amount of your wallet or account',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
            ),
            validator: (value) => value.isEmpty
                ? 'Please enter an amount' + 'for wallet or account'
                : null,
            onChanged: (value) {
              setState(() {
                _walletValue = int.parse(value);
              });
            },
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          RaisedButton(
            onPressed: () {
              print(_walletName +
                  ' ' +
                  _walletDescription +
                  ' ' +
                  ' value is ' +
                  '$_walletValue');
            },
            elevation: 5.0,
            child: Text(
              'Add Wallet',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  color: Colors.black45),
            ),
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
