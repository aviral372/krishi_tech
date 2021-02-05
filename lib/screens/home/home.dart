import 'package:flutter/material.dart';
import 'package:krishi_tech/screens/add_product.dart';
import 'package:krishi_tech/service/auth.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:krishi_tech/widgets/Category.dart';
import 'package:krishi_tech/widgets/products.dart';

class Home extends StatelessWidget {
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,

        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/c2.jpg'),
          AssetImage('images/c3.jpg'),
          AssetImage('images/c4.jpg'),
          AssetImage('images/c5.jpg'),
          AssetImage('images/c6.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotColor: Colors.yellowAccent,
      ),
    );
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Aviral'),
              accountEmail: Text('aviral@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.person, color: Colors.green,),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.lightGreen,
            ),),

            //body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.yellow),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.yellow,),
              ),
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProduct()));},
              child: ListTile(
                title: Text('Post An Add?'),
                leading: Icon(Icons.dashboard, color: Colors.yellow,),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.lightGreen,),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'KrishiTech',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[FlatButton.icon(onPressed: ()async{await _auth.signOut();}, icon: Icon(Icons.person), label: Text('Log Out'),),],
        backgroundColor: Colors.lightGreen,
      ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/farm.png'), fit: BoxFit.cover),
          ),
          child: new ListView(
            children: <Widget>[
              image_carousel,
              SizedBox(height: 10.0),
              Center(child: Text('Categories', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),),),
              SizedBox(height: 10.0),
              Category(),
              SizedBox(height: 10.0),
              Center(child: Text('For Sale', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),),),
              Container(
                height: 320.0,
                child: Products(),
              ),
            ],
          ),
        ),

    );
  }
}
