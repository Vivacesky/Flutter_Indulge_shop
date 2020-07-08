import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:food_app/screens/cart.dart';
import 'package:food_app/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/indulge-logo.png'),
          height: 30.0,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 28.0,
          ),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: <Widget>[
          Badge(
            badgeColor: Colors.green[600],
            padding: EdgeInsets.all(8.0),
            position: BadgePosition.topRight(top: 0, right: 0),
            animationType: BadgeAnimationType.scale,
            showBadge: true,
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              color: Colors.black,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              ),
              icon: Icon(
                Icons.shopping_cart,
                size: 28.0,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Stack(
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.search,
                  cursorColor: Colors.green[600],
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.green,
            indicatorWeight: 3.0,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Lowcarb",
                  style: TextStyle(fontSize: 18.0, fontFamily: 'OpenSans'),
                ),
              ),
              Tab(
                child: Text(
                  "Vegan",
                  style: TextStyle(fontSize: 18.0, fontFamily: 'OpenSans'),
                ),
              ),
              Tab(
                child: Text(
                  "Aankomen",
                  style: TextStyle(fontSize: 18.0, fontFamily: 'OpenSans'),
                ),
              ),
              Tab(
                child: Text(
                  "Afvallen",
                  style: TextStyle(fontSize: 18.0, fontFamily: 'OpenSans'),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  ProductList(),
                  ProductList(),
                  ProductList(),
                  ProductList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
