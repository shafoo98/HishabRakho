import 'package:flutter/material.dart';
import 'package:hishab_rakho/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Text Field state

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(73, 118, 185, 1.0),
        elevation: 1.0,
        title: Text(
          "Already have an account? ",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.011),
            child: FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                "Log In",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(223, 242, 241, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        child: Form(
          key: _formKey,
          child: Wrap(
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage('images/Rectangle7.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Text(
                      'HishabRakho',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(73, 118, 185, 1.0),
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Text(
                      'Manage your money more efficiently',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(131, 141, 225, 0.8),
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.05, bottom: size.height * 0.02),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlue[100], width: 2.0),
                        ),
                      ),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your email address' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val.trim();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.025),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue[100]),
                        ),
                      ),
                      validator: (val) => val.length < 8
                          ? 'Enter a password more than 8 characters'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: size.width,
                    child: FlatButton(
                        color: Color.fromRGBO(112, 146, 197, 1.0),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _authService
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Please enter a valid email";
                              });
                            }
                          }
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
