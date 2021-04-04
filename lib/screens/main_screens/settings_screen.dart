import 'package:flutter/material.dart';
import 'package:hishab_rakho/services/auth.dart';

class Settings extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.portrait),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Privacy Policy'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About Us'),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Sign Out'),
          onTap: () => _authService.signOut(),
        ),
      ],
    );
  }
}
