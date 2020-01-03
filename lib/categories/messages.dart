import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('MESSAGE', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
