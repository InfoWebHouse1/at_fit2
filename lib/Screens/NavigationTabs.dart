import 'package:at_fit/Screens/Home.dart';
import 'package:at_fit/Screens/SettingPage_NQ.dart';
import 'package:at_fit/Screens/editPageScreen.dart';
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
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text("Water Remainder Screen"),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
              child: Text("Naqi Setting Screen"),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
              child: Text("Ahsan Setting Screen"),)

          ],
        ),
      ),
    );
  }
}
