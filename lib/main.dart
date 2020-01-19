import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthnest/ui/loginPage/login.dart';

void main() => runApp(MaterialApp(
      title: 'HealthNest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Colors.teal,
          fontFamily: 'nunito'),
      home: HealthNestLogin(),
    ));
