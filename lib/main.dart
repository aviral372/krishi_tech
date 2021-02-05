import 'package:krishi_tech/models/user.dart';
import 'package:krishi_tech/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krishi_tech/service/auth.dart';
import 'package:provider/provider.dart';
import 'screens/authenticate/login.dart';
import 'screens/authenticate/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp()
  );

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<Use>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }

}

