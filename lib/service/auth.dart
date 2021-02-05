import 'dart:developer';
import 'package:krishi_tech/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;

  // create user obj based on firebaseUser
  Use _userFromFirebaseUser(User use){
    return use != null ? Use(uid: use.uid): null;
  }
  // auth change user stream
Stream<Use> get user{
    return _auth.authStateChanges()
    .map(_userFromFirebaseUser);
}
  //sign in with email & pass
  Future loginWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email & password
Future registerWithEmailAndPassword(String email, String password) async{
    try{
    UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
}

  //sign out
Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
}
}