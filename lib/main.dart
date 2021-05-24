// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:calc_frisidea/module/prima-screen/PrimaScreen.dart';
import 'package:calc_frisidea/module/profile-screen/ProfileScreen.dart';
import 'package:calc_frisidea/module/provider/PrimaProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PrimaProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(), // This is required
      )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  PersistentTabController _persistentTabController =
      PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   // title: Text("Prima Calc"),
        // ),
        body: SafeArea(
      bottom: false,
      child: PersistentTabView(
        context,
        controller: _persistentTabController,
        screens: _buildScreenNavbar(),
        items: _buildItemsNavbar(),
        confineInSafeArea: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    ));
  }

  List<Widget> _buildScreenNavbar() {
    return [PrimaScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _buildItemsNavbar() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.number),
        title: ("Prima Calc"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
