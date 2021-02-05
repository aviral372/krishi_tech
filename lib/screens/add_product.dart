import 'package:flutter/material.dart';
import 'dart:convert';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color white= Colors.white;
  Color black= Colors.black;
  Color grey= Colors.grey;
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController productNameController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'KrishiTech',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    onPressed: (){},
                      child: Padding(padding: const EdgeInsets.fromLTRB(14,40,14,40),child: new Icon(Icons.add, color: grey,),),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      onPressed: (){},
                      child: Padding(padding: const EdgeInsets.fromLTRB(14,40,14,40),child: new Icon(Icons.add, color: grey,),),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      onPressed: (){},
                      child: Padding(padding: const EdgeInsets.fromLTRB(14,40,14,40),child: new Icon(Icons.add, color: grey,),),
                    ),
                  ),
                ),],
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  hintText: 'Product Name'
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
