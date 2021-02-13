import 'package:at_fit/utills/ScreenHeaderCurvedContainer.dart';
import 'package:at_fit/utills/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 400,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BuildTextFields(
                      fields: "Name: ",
                      fieldsValue: "Frasat Ali",
                    ),
                    BuildTextFields(
                      fields: "Email: ",
                      fieldsValue: "Frasatali1177@gmail.com",
                    ),
                    BuildTextFields(
                      fields: "Age: ",
                      fieldsValue: "22",
                    ),
                    BuildTextFields(
                      fields: "Gender: ",
                      fieldsValue: "Male",
                    )
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: size.width,
              height: size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  width: size.width / 2,
                  height: size.width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 2),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("Assets/Images/mario.png")),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 200, left: 150),
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20.0,
                child: IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    print("Change Pic");
                  },
                )),
          )
        ],
      ),
    );
  }
}

class BuildTextFields extends StatefulWidget {

  final String fields;
  final String fieldsValue;

  const BuildTextFields({Key key, this.fields, this.fieldsValue}) : super(key: key);

  @override
  _BuildTextFieldsState createState() => _BuildTextFieldsState();
}

class _BuildTextFieldsState extends State<BuildTextFields> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.75), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.fields, style: kTitleTextStyle,),
              Expanded(child: Center(child: Text(widget.fieldsValue, style: kFieldValueTextStyle,)))
            ],
          ),
        ),
      ),
    );
  }
}
