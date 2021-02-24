import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Text('No Internet Connection'),
      ),
    ));
  }
}
