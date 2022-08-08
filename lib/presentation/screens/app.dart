import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tex_stox/constants/strings.dart';
// import 'package:tex_stox/constants/strings.dart';
import 'package:tex_stox/presentation/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              child: Text("click to go to the dashboard"),
              onTap: () => Navigator.pushNamed(context, kDashBoard))),
    );
  }
}
