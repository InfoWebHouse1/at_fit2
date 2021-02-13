import 'file:///E:/Android/Flutter_Projects/at_Fit%20APP/at_fit/lib/Screens/myScreens/NavigationTabs.dart';
import 'package:at_fit/utills/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationButtons(),
    );
  }
}
