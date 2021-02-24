import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('HomePage'),
      // ),
      child: Center(
        child: CupertinoButton(
          child: Text('About Page'),
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return AboutPage();
            }));
          },
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('About Nested Page'),
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return AboutPageNested();
            }));
          },
        ),
      ),
    );
  }
}

class AboutPageNested extends StatefulWidget {
  AboutPageNested({Key key}) : super(key: key);

  @override
  _AboutPageNestedState createState() => _AboutPageNestedState();
}

class _AboutPageNestedState extends State<AboutPageNested> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text('This is About Nested page'),
      ),
    );
  }
}
