import 'package:flutter/material.dart';
import 'package:krishi_tech/service/auth.dart';
import 'package:krishi_tech/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth= AuthService();
  final _formKey= GlobalKey<FormState>();
  bool loading= false;

  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'KrishiTech',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[FlatButton.icon(onPressed: (){widget.toggleView();}, icon: Icon(Icons.person), label: Text('Login'),),],
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/farm.png'), fit: BoxFit.cover),
        ),
        child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Namaste',
                      style: TextStyle(
                          fontSize: 85.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen),
                      ),
                    ),
                    cursorColor: Colors.yellowAccent,
                    style: TextStyle(color: Colors.white),
                    validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                    onChanged: (val){
                      setState(() {
                        email=val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen),
                      ),
                    ),
                    obscureText: true,
                    validator: (val) => val.length<6 ? 'Enter a password of 6+ chars long' : null,
                    onChanged: (val){
                      setState(() {
                        password=val;
                      });
                    },
                    cursorColor: Colors.yellowAccent,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(height: 40.0),
                  ButtonTheme(
                    minWidth: 300.0,
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: ()async {
                        if(_formKey.currentState.validate()){
                          setState(() {
                            loading=true;
                          });
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if(result==null){
                            setState((){
                              error='please give a valid email';
                              loading=false;});
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

    