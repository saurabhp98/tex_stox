import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tex_stox/constants/strings.dart';
// import 'package:tex_stox/constants/strings.dart';
import 'package:tex_stox/presentation/router.dart';
import 'package:tex_stox/presentation/screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1),
      () => Navigator.popAndPushNamed(context, RouteConstants.kDashBoard),
    );
    return SplashScreen();
  }
}
