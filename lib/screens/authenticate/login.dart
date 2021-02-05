import 'package:flutter/material.dart';
import 'package:krishi_tech/service/auth.dart';
import 'package:krishi_tech/shared/loading.dart';

class login extends StatefulWidget {

  final Function toggleView;
  login({this.toggleView});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
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
        actions: <Widget>[FlatButton.icon(onPressed: (){widget.toggleView();}, icon: Icon(Icons.person), label: Text('Register'),),],
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
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  ButtonTheme(
                    minWidth: 300.0,
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                      onPressed: ()async {
                        if(_formKey.currentState.validate()){
                          setState(() {
                            loading=true;
                          });
                          dynamic result = await _auth.loginWithEmailAndPassword(email, password);
                           if(result==null){
                             setState((){
                               error= 'Invalid Credentials';
                              loading= false;});
                           }
                        }
                    },
                  ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blueAccent,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ImageIcon(
                              NetworkImage(
                                  'https://images.squarespace-cdn.com/content/5b1590a93c3a53e49c6d280d/1528490757421-CMDZGD31CHP8A2OOGOL5/facebook-icon-logo-C61047A9E7-seeklogo.com.png?content-type=image%2Fpng'),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text(
                              'Login With Facebook',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
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

