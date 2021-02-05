import 'package:krishi_tech/screens/authenticate/register.dart';
import 'package:krishi_tech/screens/authenticate/login.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = true;
  void toggleView(){
    setState(() {
      showLogin = !showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLogin){
      return login(toggleView: toggleView);
    }
    else{
      return Register(toggleView: toggleView);
    }
  }
}
