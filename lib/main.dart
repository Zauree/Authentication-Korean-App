import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_korean_app/pages/wrapper.dart';
import 'package:firebase_flutter_korean_app/resources/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_flutter_korean_app/model/users.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

