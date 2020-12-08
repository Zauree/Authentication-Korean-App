import 'package:firebase_flutter_korean_app/resources/authenticate.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final AuthenticationService _authenticate = AuthenticationService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in to Korean app'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Log In Anonymously'),
          onPressed: () async{
            dynamic res = await _authenticate.loginAnonymous();
            if(res == null){
              print('error loginning');
            } else {
              print('login was successful');
              print(res);
            }

          },
        ),
      ),
    );
  }
}
