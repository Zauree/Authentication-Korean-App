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
  final _formkey = GlobalKey<FormState>();

  // text's state
  String errorr = '';

  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),        child: Form(
          key: _formkey,
          child: Column(
            children:<Widget> [
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(hintText: 'Пошта'),
                  validator: (val) => val.isEmpty ? 'Поштаңызды теріңіз!' : null,
                  onChanged: (val){
                  setState(() => mail = val);
                }
              ),
              SizedBox( height: 12.0),
              Text(errorr, style: TextStyle(
                color: Colors.redAccent,
              ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Құпия сөз'),
                obscureText: true,
                validator: (val) => val.length < 6 ? '6 немесе одан да көп таңбалар енгізіңіз!' : null,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                'Кіру',
                style: TextStyle(color: Colors.white),
              ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    print('valid');
                    dynamic res = await _authenticate.logInMailPassword(mail, password);
                    if(res == null){
                    setState(() => errorr = 'Пошта немесе құпия сөз қате енгізілген немесе алдын ала тіркелген');

                   }
                  }

                }

              ),
              FlatButton.icon(
                icon: Icon(Icons.person_add, color: Colors.white,),
                label: Text('Аккаунтыңыз жоқ па?, Тіркелу', style: TextStyle(color: Colors.blue,),),
                onPressed: () => widget.toggle(),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
