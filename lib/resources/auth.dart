import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_korean_app/model/users.dart';

class AuthenticationService {

  final FirebaseAuth _authenticate = FirebaseAuth.instance;

  //creating user object of Firebase user
  Users _userFirebaseUser(User user){
    if (user != null) {
      return Users(uniqid: user.uid);
    } else {
      return null;
    }
  }

  // authentication change user(stream)
  Stream<Users> get user{
    return _authenticate.authStateChanges()
        .map(_userFirebaseUser);
  }



// login anonymously
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


  Future signOut() async{
    try{
      return await _authenticate.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }



}