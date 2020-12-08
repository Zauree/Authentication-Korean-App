import 'package:firebase_flutter_korean_app/pages/authentication/authentication.dart';
import 'package:firebase_flutter_korean_app/pages/home-page/home-page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter_korean_app/model/users.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<Users>(context);
    print(user);

    if(user == null){
      return Authentication();
    } else {
      return Home();
    }
  }
}
