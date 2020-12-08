import 'package:firebase_flutter_korean_app/resources/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home page of Korean app'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout, color: Colors.white,),
              label: Text('Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),),
              onPressed: ()async{
              await _auth.signOut();

              },
          )

        ],
      ),
    );
  }
}
