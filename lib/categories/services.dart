import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SERVICES', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
