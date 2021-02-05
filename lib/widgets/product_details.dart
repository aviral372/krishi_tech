import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_pic;
  final product_detail_location;
  final product_detail_price;
  final product_detail_quantity;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_pic,
    this.product_detail_location,
    this.product_detail_price,
    this.product_detail_quantity,

});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
    body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/farm.png'), fit: BoxFit.cover),
    ),
    child: new ListView(
      children: <Widget>[
        new Container(
          height: 300.0,
          child: GridTile(child: Container(
            color: Colors.white,
            child: Image.asset(widget.product_detail_pic),
          ),
          footer: new Container(
            color: Colors.white,
            child: ListTile(
              leading: new Text(widget.product_detail_name, style: TextStyle(fontWeight: FontWeight.bold),),
              title: new Row(
                children: <Widget>[
                  Expanded(child: new Text(widget.product_detail_price, style: TextStyle(color: Colors.red),),),
                  Expanded(child: new Text(widget.product_detail_quantity),),
                  Expanded(child: new Text(widget.product_detail_location),),
                ],
              ),
            ),
          ),),
        ),

        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(onPressed: (){},
              color: Colors.yellow,
              textColor: Colors.red,
              elevation: 0.2,
              child: new Text("Interested? Contact Now!"),),
            )
          ],
        )
      ],
    ),),);
  }
}
