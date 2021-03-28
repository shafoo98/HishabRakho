import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/user.dart';
import 'package:hishab_rakho/screens/wrapper.dart';
import 'package:hishab_rakho/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(HishabRakho());

class HishabRakho extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
