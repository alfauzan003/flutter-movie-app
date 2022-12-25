import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Prak Mobile',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
