import 'package:firebase_flutter_korean_app/pages/authentication/login.dart';
import 'package:firebase_flutter_korean_app/pages/authentication/registration.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool displayLogIn = true;

    void toggle() {
    setState(() => displayLogIn = !displayLogIn);
  }

  @override
  Widget build(BuildContext context) {
    if(displayLogIn) {
      return LogIn(toggle: toggle);
    }else{
      return Registration(toggle: toggle);
    }
  }
}
