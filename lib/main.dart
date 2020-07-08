import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find your food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green[600],
          accentColor: Colors.green[600],
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          bottomSheetTheme: BottomSheetThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))))),
      home: HomeScreen(),
    );
  }
}
