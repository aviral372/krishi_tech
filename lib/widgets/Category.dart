import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow:[
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.blueGrey,
                  )
                ]
              ),
              width: 130,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                  ImageIcon(AssetImage('images/fruit.png'),size: 50, color: Colors.blueAccent,),
                    SizedBox(height: 10.0),
                  Text('Fruits', style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),),
                ],
            ),
              ),
        ),
          ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.blueGrey,
                      )
                    ]
                ),
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ImageIcon(AssetImage('images/veg.png'),size: 50, color: Colors.blueAccent),
                      SizedBox(height: 10.0),
                      Text('Vegetables',style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.blueGrey,
                      )
                    ]
                ),
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ImageIcon(AssetImage('images/pulses.png'),size: 50, color: Colors.blueAccent),
                      SizedBox(height: 10.0),
                      Text('Pulses',style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.blueGrey,
                      )
                    ]
                ),
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ImageIcon(AssetImage('images/cereal.png'),size: 50, color: Colors.blueAccent),
                      SizedBox(height: 10.0),
                      Text('Cereal', style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
      ],
    ),
    );
  }
}
