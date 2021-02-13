import 'file:///E:/Android/Flutter_Projects/at_Fit%20APP/at_fit/lib/Screens/myScreens/Home.dart';
import 'package:at_fit/Screens/editPageScreen.dart';
import 'package:at_fit/Screens/myScreens/profileSettingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text("Water Remainder Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => profileSettingScreen()));
              },
              child: Text("My Setting Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
