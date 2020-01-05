import 'package:flutter/material.dart';

Widget _dropdown() {
  return DropdownButton<String>(
    items: <String>['All Communities', 'Diet', 'Love', 'Doctor']
        .map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList(),
    onChanged: (_) {
      Text('Hi Example',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal));
    },
  );
}
