import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _authenticate = FirebaseAuth.instance;

  Future loginAnonymous() async{
    try{
      UserCredential resultAuth = await _authenticate.signInAnonymously();
      User firebaseUser = resultAuth.user;
      return firebaseUser;
  } catch(e){
      print(e.toString());
      return null;
    }
  }



}