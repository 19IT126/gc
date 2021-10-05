import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

/*class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  }
}*/
class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int isSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              size: 30.0,
              color: isSelected == 1 ? kPrimaryColor : Colors.grey[400],
            ),
            onPressed: () {
              setState(() {
                isSelected = 1;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.article_outlined,
              size: 30.0,
              color: isSelected == 2 ? kPrimaryColor : Colors.grey[400],
            ),
            onPressed: () {
              setState(() {
                isSelected = 2;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.alarm_outlined,
              size: 30.0,
              color: isSelected == 3 ? kPrimaryColor : Colors.grey[350],
            ),
            onPressed: () {
              setState(() {
                isSelected = 3;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.local_florist,
              size: 30.0,
              color: isSelected == 4 ? kPrimaryColor : Colors.grey[350],
            ),
            onPressed: () {
              setState(() {
                isSelected = 4;
              });
            },
          ),
        ],
      ),
    );
  }
}
