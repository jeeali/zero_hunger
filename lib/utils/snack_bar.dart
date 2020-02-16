import 'package:flutter/material.dart';

class Sbar {
  void showSnackBar(String text, GlobalKey<ScaffoldState> mScaffoldState) {
    final snackBar = new SnackBar(
      content: new Text('$text'),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
    );
    mScaffoldState.currentState.showSnackBar(snackBar);
  }
}
