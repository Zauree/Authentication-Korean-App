import 'package:firebase_flutter_korean_app/resources/auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {

  final Function toggle;
  LogIn({ this.toggle});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final AuthenticationService _authenticate = AuthenticationService();

  // text's state

  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person_add, color: Colors.white,),
            label: Text('Sign Up', style: TextStyle(color: Colors.white,),),
            onPressed: (){
              widget.toggle();

            },

          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children:<Widget> [
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val){
                  setState(() => mail = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
                onPressed: () async {
                  print(mail);
                  print(password);

                }

              )
            ],
          ),
        ),
      ),
    );
  }
}
