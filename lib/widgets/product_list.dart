import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/screens/product_detail.dart';
import 'package:food_app/widgets/bottom_modal.dart';
import 'package:food_app/widgets/product_list_shimmer.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _isLoading = true;
  Timer _timer;

  @override
  void initState() {
    _timer = new Timer(new Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: _isLoading
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProductListShimmer(),
                          Spacer(),
                          ProductListShimmer(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              _buildFruitCard("Kiwi", "assets/food1.png",
                                  "€8.50", 0xffF7DFB9, 0XffFAF0DA),
                              _buildFruitCard("Avocado", "assets/food1.png",
                                  "€8.50", 0xffC4D4A3, 0XffE0E8CF),
                              _buildFruitCard("Mango", "assets/food1.png",
                                  "€8.00", 0xffF6E475, 0XffF9EFB0),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: <Widget>[
                              _buildFruitCard("Papafdya", "assets/food1.png",
                                  "€8.00", 0xffFFC498, 0XffFDDCC1),
                              _buildFruitCard("Strawberry", "assets/food1.png",
                                  "€8.50", 0xffF0AEAF, 0XffF8C6CA),
                              _buildFruitCard("Strawberry", "assets/food1.png",
                                  "€8.50", 0xffF0AEAF, 0XffF8C6CA),
                            ],
                          )
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildFruitCard(
      String name, String asset, String rate, int color, int color2) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetail()),
        );
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(color2),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => _onAddPressed(name, color, asset),
                              child: Icon(
                                Icons.add,
                                size: 38.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                        child: Text(
                          name,
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Text(
                          "Gurugram Mandi Haryana",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildRate(rate),
                                Text(
                                  "Per Stuk",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            left: -15,
            child: Image.asset(asset, fit: BoxFit.contain, height: 100.0),
          ),
        ],
      ),
    );
  }

  _buildRate(String rate) {
    if (rate == "€8.00") {
      return Row(
        children: <Widget>[
          Text(
            rate,
            style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            rate,
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontFamily: 'OpenSans',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ],
      );
    } else {
      return Text(
        rate,
        style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      );
    }
  }

  _onAddPressed(String name, int color, String asset) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheetCart(color: color, name: name, asset: asset);
        });
  }
}
