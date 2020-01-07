import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget dropdown() {
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

showPopupMenu(BuildContext context) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(100, 400, 100, 400),
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(FontAwesomeIcons.userTimes, size: 15),
          onTap: () => print('hide'),
          title: Text('Hide <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(
            FontAwesomeIcons.solidEyeSlash,
            size: 15,
          ),
          onTap: () => print('Unfollow <username>'),
          title: Text('Unfollow <username>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.report),
          onTap: () => print('Report'),
          title: Text('Report <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.link),
          onTap: () => print('hide'),
          title: Text('Copy <Post type> link'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
    ],
    elevation: 8.0,
  );
}
