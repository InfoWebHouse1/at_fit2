import 'package:at_fit/utills/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  _ProfileListItemState createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 4.0,
      ).copyWith(
        bottom: kSpacingUnit * 2.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 2.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit * 3.0),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: kSpacingUnit * 2.5,
          ),
          SizedBox(width: kSpacingUnit * 1.5),
          Text(
            widget.text,
            style: kTitleTextStyle,
          ),
          Spacer(),
          if (widget.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit * 2.5,
            ),
        ],
      ),
    );
  }
}
