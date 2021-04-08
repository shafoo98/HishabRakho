import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/user.dart';
import 'package:hishab_rakho/screens/wrapper.dart';
import 'package:hishab_rakho/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HishabRakho());
}

class HishabRakho extends StatelessWidget {
  // This widget is the root of your application.
  //
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
