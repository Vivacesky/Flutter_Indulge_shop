import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetCart extends StatefulWidget {
  BottomSheetCart({
    @required this.color,
    @required this.name,
    @required this.asset,
  });

  final int color;
  final String name;
  final String asset;

  @override
  _BottomSheet createState() => _BottomSheet();
}

class _BottomSheet extends State<BottomSheetCart> {
  int _amountToCart;
  int _color;
  String _asset;
  String _name;

  @override
  void initState() {
    _amountToCart = 1;
    _color = widget.color;
    _asset = widget.asset;
    _name = widget.name;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      decoration: BoxDecoration(
        color: Color(_color),
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Container(
            width: 100,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          Image.asset(
            _asset,
            fit: BoxFit.contain,
            height: 100.0,
          ),
          SizedBox(height: 10.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                size: 36,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() => _amountToCart -= 1);
              },
            ),
            SizedBox(width: 50.0),
            new Text(
              _amountToCart.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 50.0),
            IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                size: 36,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() => _amountToCart += 1);
              },
            ),
          ]),
          SizedBox(height: 10.0),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width / 2,
            child: RaisedButton.icon(
              elevation: 0,
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.white)),
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.pop(context);
                //add amount to cart
              },
              label: Text(
                'Add to cart',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
