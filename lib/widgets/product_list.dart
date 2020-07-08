import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        _buildFruitCard("Kiwi", "assets/avocado.png", "€8.50",
                            0xffF7DFB9, 0XffFAF0DA),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: _buildFruitCard(
                              "Avocado",
                              "assets/avocado.png",
                              "€8.50",
                              0xffC4D4A3,
                              0XffE0E8CF),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildFruitCard("Mango", "assets/avocado.png", "€8.00",
                            0xffF6E475, 0XffF9EFB0),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        _buildFruitCard("Papafdya", "assets/avocado.png",
                            "€8.00", 0xffFFC498, 0XffFDDCC1),
                        SizedBox(
                          height: 20,
                        ),
                        _buildFruitCard("Strawberry", "assets/avocado.png",
                            "€8.50", 0xffF0AEAF, 0XffF8C6CA),
                        SizedBox(
                          height: 20,
                        ),
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
    return Container(
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
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
              height: (MediaQuery.of(context).size.height) / 7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
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
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
}
