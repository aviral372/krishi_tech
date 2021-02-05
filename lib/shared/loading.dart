import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/farm.png'), fit: BoxFit.cover),
      ),
      child: Center(
        child: SpinKitRing(
          color: Colors.yellowAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
