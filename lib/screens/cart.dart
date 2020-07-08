import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Shopping Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
