import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:berting_app/login/login_view.dart';


void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginView(),
    );
  }
} 