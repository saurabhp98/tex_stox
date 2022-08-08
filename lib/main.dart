import 'package:flutter/material.dart';
import 'package:tex_stox/presentation/router.dart';
import 'package:tex_stox/presentation/screens/app.dart';

void main() {
  runApp(MyApp(router: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tex Stox',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
