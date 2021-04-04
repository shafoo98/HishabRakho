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
            decoration: InputDecoration(
              hintText: 'Name of wallet or account',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
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
            height: size.height * 0.025,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Describe your wallet or account in details',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
            validator: (value) => value.isEmpty
                ? 'Please enter a description' + 'for wallet or account'
                : null,
            onChanged: (value) {
              setState(() {
                _walletName = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
