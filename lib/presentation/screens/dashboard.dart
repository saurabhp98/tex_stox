import 'package:flutter/material.dart';
import 'package:tex_stox/constants/strings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            InkWell(
              child: Text('Go To Client Page'),
              onTap: () => Navigator.pushNamed(context, kClientPageRoute),
            )
          ],
        ),
      ),
    );
  }
}
