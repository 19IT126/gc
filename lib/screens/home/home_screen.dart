import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gc/constants.dart';
import 'package:gc/screens/alarm/alarm_screen.dart';
import 'package:gc/screens/articles/article_screen.dart';
import 'package:gc/screens/garden/garden_screen.dart';
import 'package:gc/screens/home/components/body.dart';
import 'package:gc/screens/home/components/sidebar.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _isSelected = 0;

  Widget index(int selectedIndex, BuildContext context) {
    switch (selectedIndex) {
      case 0:
        {
          return Body();
        }
      case 1:
        {
          return ArticleScreen();
        }
      case 2:
        {
          return AlarmScreen();
        }
      case 3:
        {
          return GardenScreen();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        elevation: 0,
        // title: Text('Garden Central'),
      ),
      //appBar: buildAppBar(),
      body: index(_isSelected, context),
      bottomNavigationBar: MoltenBottomNavigationBar(
        duration: Duration(milliseconds: 300),
        barColor: Colors.white,
        domeCircleColor: kPrimaryColor,
        selectedIndex: _isSelected,
        onTabChange: (clickedIndex) {
          setState(
            () {
              _isSelected = clickedIndex;
            },
          );
        },
        tabs: [
          MoltenTab(
            icon: Icon(Icons.search_outlined),
            selectedColor: Colors.white,
          ),
          MoltenTab(
            icon: Icon(Icons.article_outlined),
            selectedColor: Colors.white,
          ),
          MoltenTab(
            icon: Icon(Icons.alarm_outlined),
            selectedColor: Colors.white,
          ),
          MoltenTab(
            icon: Icon(Icons.local_florist),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
