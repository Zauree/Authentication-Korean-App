import 'package:flutter/material.dart';
import 'package:firebase_flutter_korean_app/resources/auth.dart';
class Registration extends StatefulWidget {

  final Function toggle;
  Registration({ this.toggle});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final AuthenticationService _authenticate = AuthenticationService();


  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Registration'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign In', style: TextStyle(color: Colors.white,),),
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
                    'Sign Up',
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
