import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget actionBarRow() {
  String circleAvatar = 'https://www.w3schools.com/w3images/avatar3.png';
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('COMMUNITY',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey)),
          Row(
            children: <Widget>[
              Text('All Communities',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              SizedBox(width: 6),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.teal,
              )
            ],
          )
        ],
      ),
      CircleAvatar(
          child: ClipOval(child: Image.network(circleAvatar)),
          radius: 20,
          backgroundColor: Colors.grey)
    ],
  );
}

Widget searchTextField() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Expanded(
        child: TextField(
          maxLines: 1,
          decoration: new InputDecoration(
            suffixIcon: Icon(CupertinoIcons.search),
            contentPadding: EdgeInsets.all(12),
            hintText: 'Search posts and members',
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
              borderSide: new BorderSide(color: Colors.grey[300], width: 0.5),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        child: Icon(FontAwesomeIcons.bell, size: 26),
      )
    ],
  );
}

// This helps to build the hosrizontal list of the category items


BoxDecoration boxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      border:
          Border.all(width: 1, style: BorderStyle.solid, color: Colors.teal));
}

BoxDecoration selectedBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color: Colors.teal[200],
      border:
          Border.all(width: 1, style: BorderStyle.solid, color: Colors.teal));
}

Widget topSpace() {
  return SizedBox(height: 10);
}
