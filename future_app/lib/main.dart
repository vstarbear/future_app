import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:future_app/nav.dart';
import 'package:future_app/home_view.dart';
import 'package:future_app/profile_view.dart';
import 'package:future_app/splash_view.dart';
import 'package:future_app/error_page.dart';
import 'dart:io';
//import 'package:splashscreen/splashscreen.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(CupertinoApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected;

  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.vk.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      print(err);
    }
  }

  // This will check the connection at the beginning
  @override
  void initState() {
    _checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        }
        if (_isConnected == false) {
          return Error();
        } else {
          return MyHomePage();
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _routeIndex = 0;

  List<GlobalKey<NavigatorState>> navigationKeys;

  List<GlobalKey<NavigatorState>> generateNavigationKey() {
    List<GlobalKey<NavigatorState>> navKeys = navs.map((navItem) {
      return GlobalKey<NavigatorState>();
    }).toList();
    return navKeys;
  }

  @override
  void initState() {
    super.initState();
    navigationKeys = generateNavigationKey();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _routeIndex,
        onTap: (index) {
          if (_routeIndex == index) {
            if (navigationKeys[index].currentState.canPop())
              navigationKeys[index].currentState.pop();
          }
          _routeIndex = index;
        },
        items: navs
            .map(
              (item) => BottomNavigationBarItem(
                label: (item.title),
                icon: Icon(item.icon),
              ),
            )
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          navigatorKey: navigationKeys[index],
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return HomeView();
                break;
              case 1:
                return ProfileView();
                break;
            }
          },
        );
      },
    );
  }
}
