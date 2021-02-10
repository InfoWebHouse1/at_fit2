
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:at_fit/Screens/aboutPageItems.dart';
import 'package:at_fit/Screens/profilePage.dart';
import 'package:at_fit/utills/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return Padding(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 10),
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            crossFadeState:
            ThemeProvider.of(context).brightness == Brightness.dark
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: GestureDetector(
              onTap: () =>
                  ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
              child: Icon(
                LineAwesomeIcons.sun,
              ),
            ),
            secondChild: GestureDetector(
              onTap: () =>
                  ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
              child: Icon(
                LineAwesomeIcons.moon,
              ),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          LineAwesomeIcons.arrow_left,
        ),
        profileInfo,
        themeSwitcher,
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.user,
                              text: 'Profile',
                            ),
                          )),
                      Container(
                          child: InkWell(
                            onTap: () {
                              print("Tab");
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.history,
                              text: 'History',
                            ),
                          )),
                      Container(
                          child: InkWell(
                            onTap: () {
                              print("Tab");
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.bar_chart,
                              text: 'Report',
                            ),
                          )),
                      Container(
                          child: InkWell(
                            onTap: () {
                              print("Tab");
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.user_plus,
                              text: 'invite a Friend',
                            ),
                          )),
                      Container(
                          child: InkWell(
                            onTap: () {
                              print("Tab");
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.cog,
                              text: 'Settings',
                            ),
                          )),
                      Container(
                          child: InkWell(
                            onTap: () {
                              print("Tab");
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.question_circle,
                              text: 'Help & Support',
                            ),
                          )),
                      Container(
                          child: InkWell(
                            onTap: () {
                              print("Tab");
                            },
                            child: ProfileListItem(
                              icon: LineAwesomeIcons.alternate_sign_out,
                              text: 'Logout',
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
