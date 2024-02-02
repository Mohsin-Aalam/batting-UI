import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:tast_1/pages/Tips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "assets/images/myicon.png",
            height: 100,
            width: 100,
          ),
        ),
      ),
      bottomNavigationBar: MotionTabBar(
        controller:
            _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "TIPS",

        labels: const ["TIPS", "FREE", "ARCHIVE", "VIP", "CONTACT"],
        icons: const [
          CupertinoIcons.flame_fill,
          CupertinoIcons.gift,
          Icons.archive,
          CupertinoIcons.airplane,
          Icons.person
        ],

        tabSize: 50,

        tabBarHeight: 70,
        textStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: const Color.fromARGB(255, 249, 249, 250),
        tabIconSize: 28.0,

        tabIconSelectedSize: 28.0,
        tabSelectedColor: const Color(0xFF34A436),
        tabIconSelectedColor: const Color.fromARGB(255, 12, 12, 12),
        tabBarColor: const Color(0xFF0D1D2D),

        useSafeArea: true,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        clipBehavior: Clip.antiAlias,
        physics: const NeverScrollableScrollPhysics(),
        controller: _motionTabBarController,
        children: const [
          TipsPage(),
          Center(
            child: Text("Free"),
          ),
          Center(
            child: Text("Archive"),
          ),
          Center(
            child: Text("VIP"),
          ),
          Center(
            child: Text("Contact"),
          ),
        ],
      ),
    );
  }
}
