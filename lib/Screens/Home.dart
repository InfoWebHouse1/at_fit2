import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CircularProgress.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: size.width * 0.9,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 5),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Water Tracker",
                        style: TextStyle(
                            fontSize: 14.9,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    CircularProgressState(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressState extends StatefulWidget {
  final double completeProgress = 8;

  @override
  _CircularProgressStateState createState() => _CircularProgressStateState();
}

class _CircularProgressStateState extends State<CircularProgressState>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation<double> animation;
  double startProgress = 0;

  List<double> numbers = <double>[1, 2, 3, 4, 5, 6, 7, 8];

  List<Color> buttonColorIndex = <Color>[Colors.blue, Colors.green];
  List<String> imageIndex = <String>[
    "Assets/Images/waterGlass.png",
    "Assets/Images/greenTick.png"
  ];

  int currentButtonColorIndex = 0;
  int currentImageIndex = 0;

  void changeColor() {
    if (currentButtonColorIndex == buttonColorIndex.length) {
      currentButtonColorIndex = 0;
    } else {
      currentButtonColorIndex = 1;
    }
  }

  void changeImage() {
    if (currentImageIndex == imageIndex.length) {
      currentImageIndex = 0;
    } else {
      currentImageIndex = 1;
    }
  }

  //void changeNumber(double d) {}

  @override
  void initState() {
    super.initState();
    progressController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation = Tween<double>(begin: 0, end: widget.completeProgress)
        .animate(progressController)
          ..addListener(() {
            //
          });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${startProgress.toInt()}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  " /${widget.completeProgress.toInt()} cup Per Day",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                )
              ],
            ),
            CustomPaint(
              foregroundPainter: CircularProgressPaint(startProgress),
              child: Container(
                width: 50,
                height: 50,
                child: Center(
                    child: Image.asset(
                  imageIndex[currentImageIndex],
                  height: 15,
                  width: 15,
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ],
        ),
        Container(
          width: size.width * 0.5,
          height: 30,
          child: RaisedButton(
            onPressed: () {
              setState(() {
                if (startProgress == numbers.length) {
                  startProgress = numbers[7];
                  progressController.stop(canceled: true);
                  changeColor();
                  changeImage();
                  showDialog(context: context, builder: (context) =>CustomDialogueBox(
                    titleText: "Well Done!",
                    descriptionText: "Drinking water increase calorie burning.",

                  )

                  );
                } else {
                  startProgress++;
                  progressController.forward();
                }
                //changeNumber(startProgress);
              });
            },
            color: buttonColorIndex[currentButtonColorIndex],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text(
              "Drink",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDialogueBox extends StatelessWidget {
  final String titleText, descriptionText, buttonText;
  final Image image;

  CustomDialogueBox({this.titleText, this.descriptionText, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top:200, left: 16, bottom: 16, right: 16 ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0,10.0),
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(titleText, style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              SizedBox(height: 16,),
              Text(descriptionText, style: TextStyle(
                fontSize: 14
              ),),
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Done!"),
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 90,
              backgroundImage: AssetImage("Assets/GIF/waterAnimation.gif"),
            )
        )
      ],
    );

  }
}












