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
  final _formkey = GlobalKey<FormState>();


  String errorr = '';
  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
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
                  fontSize: 14
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
                    'Тіркелу',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      dynamic res = await _authenticate.signUpMailPassword(mail, password);
                      if(res == null){
                        setState(() => errorr = 'Бұл пошта жарамсыз!');
                      }
                    }
                  }

              ),
              FlatButton.icon(
                icon: Icon(Icons.person, color: Colors.blue, size: 20,),
                label: Text('Алдын ала тіркелдіңіз бе?', style: TextStyle(color: Colors.blue[600],),),
                onPressed: () => widget.toggle(),
              )

            ],
          ),
        ),
      ),
      ),
    );
  }
}
