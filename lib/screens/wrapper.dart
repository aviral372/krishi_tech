import 'package:krishi_tech/models/user.dart';
import 'package:krishi_tech/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:krishi_tech/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<Use>(context);
    //return either home or authenticate
    if(user==null)
      {
        return Authenticate();
      }
    else{
      return Home();
    }
  }
}
