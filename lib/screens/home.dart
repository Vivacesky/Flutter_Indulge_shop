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
  FocusNode _searchBarFocusNode;
  int _amountCart = 0;

  @override
  void initState() {
    super.initState();
    _searchBarFocusNode = FocusNode();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _searchBarFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/indulge-logo.png'),
          height: 30.0,
        ),
        actions: <Widget>[
          Badge(
            badgeColor: Colors.green[600],
            padding: EdgeInsets.all(8.0),
            position: BadgePosition.topRight(top: 0, right: 0),
            animationType: BadgeAnimationType.scale,
            showBadge: true,
            badgeContent: Text(
              _amountCart.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              color: Colors.black,
              onPressed: () {
                _searchBarFocusNode.unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
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
                  focusNode: _searchBarFocusNode,
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
                      _searchBarFocusNode.unfocus();
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
