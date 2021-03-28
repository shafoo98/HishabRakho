import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/user.dart';
import 'package:hishab_rakho/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import 'home_screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //Return either Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
