import 'package:flutter/material.dart';
import 'package:krishi_tech/widgets/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [

  {
  "name": "banana",
  "picture": "images/banana.jpg",
  "location":"Kanpur (Uttar Pradesh)",
  "price":"Rs 30/ton",
  "Quantity": "25 tons",
},
    {
      "name": "rajma",
      "picture": "images/rajma.jpg",
      "location":"Bhatinda (Punjab)",
      "price":"Rs 50/ton",
      "Quantity": "25 tons",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
          return Single_prod(
          prod_name: product_list[index]['name'],
            prod_pic: product_list[index]['picture'],
            prod_location: product_list[index]['location'],
            prod_price: product_list[index]['price'],
            prod_quantity: product_list[index]['Quantity'],
          );
      },
      );
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_location;
  final prod_price;
  final prod_quantity;

  Single_prod({
  this.prod_name,
  this.prod_pic,
  this.prod_location,
  this.prod_price,
  this.prod_quantity,});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: prod_name,
          child: Material(
            child: InkWell(onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new ProductDetails(
              product_detail_name: prod_name,
              product_detail_pic: prod_pic,
              product_detail_price: prod_price,
              product_detail_quantity: prod_quantity,
              product_detail_location: prod_location,
            ))),
              child: GridTile(
                footer: Container(
                color: Colors.white70,
                  child: ListTile(
                    leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
                    title: Text(prod_price, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    subtitle: Text(prod_location, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
              ),
              child: Image.asset(prod_pic,fit: BoxFit.cover,),),),
          )),
    );

  }
}

