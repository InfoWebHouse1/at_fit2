import 'package:at_fit/Screens/myScreens/SettingPageTabs/ProfileScreen.dart';
import 'package:at_fit/utills/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class profileSettingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(BoxConstraints.expand(height: 800, width: size.width),
        allowFontScaling: true);
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 40.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: backgroundColor,
                  ),
                  Icon(
                    Icons.settings,
                    color: backgroundColor,
                  ),
                ],
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: 45),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('Assets/Images/logo.png'),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * 0.9,
                child: Text(
                  "ME",
                  style: kCaptionTextStyle,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.user,
                    title: "Profile",
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    print("History");
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.history,
                    title: "History",
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    print("Report");
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.bar_chart,
                    title: "Report",
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    print("Invite a friend");
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.user_plus,
                    title: "Invite a Friend",
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    print("Setting");
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.cog,
                    title: "Setting",
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    print("Help and Support");
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.question_circle,
                    title: "Help and Support",
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  splashColor: T_Color,
                  highlightColor: T_Color,
                  hoverColor: T_Color,
                  onTap: () {
                    print("Logout");
                  },
                  child: SettingScreenItems(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    title: "Logout",
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * 0.9,
                child: Text(
                  "Version: ${version}",
                  style: kCaptionTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingScreenItems extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool hasNavigation;

  const SettingScreenItems(
      {Key key, this.icon, this.title, this.hasNavigation = true})
      : super(key: key);

  @override
  _SettingScreenItemsState createState() => _SettingScreenItemsState();
}

class _SettingScreenItemsState extends State<SettingScreenItems> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                widget.icon,
                color: IconColor,
              ),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  widget.title,
                  style: kTitleTextStyle,
                )),
            Spacer(),
            if (widget.hasNavigation)
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: IconColor,
                  )),
          ],
        ),
      ),
    );
  }
}
