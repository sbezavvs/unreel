import 'package:Unreel/src/views/bottom_navigation_view/tabIcon_data.dart';
import 'package:Unreel/src/logic/utils/app_theme.dart';
import 'package:Unreel/src/views/explore/explore_screen.dart';
import 'package:Unreel/src/views/personal/personal_view.dart';
import 'package:Unreel/src/views/social/invite_friend_screen.dart';
import 'package:Unreel/src/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _UnreelMainScreenState createState() => _UnreelMainScreenState();
}

class _UnreelMainScreenState extends State<MainScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.nearlyBlack,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    tabBody = HomeScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyBlack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = HomeScreen(
                      animationController: animationController); // Home tab
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ExploreScreen(
                      animationController: animationController); // Explore tab
                });
              });
            } else if (index == 2) {
              setState(() {
                tabBody = PersonalView(
                    animationController: animationController); // Personal tab
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = Social(
                      animationController: animationController); // Social tab
                });
              });
            }
          },
        ),
      ],
    );
  }
}
