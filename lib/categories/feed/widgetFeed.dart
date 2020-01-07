import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/categories/feed/feed_model.dart';

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
          radius: 25,
          backgroundColor: Colors.grey[300])
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

Widget horizontalCategories() {
  // horizontal category list
  List<Category> listCategory = [
    Category(categoryType: 'All posts'),
    Category(categoryType: 'News'),
    Category(categoryType: 'Doctor'),
    Category(categoryType: 'Lifestyle'),
    Category(categoryType: 'Symptom'),
    Category(categoryType: 'Entertainment'),
    Category(categoryType: 'Love'),
  ];

  return SizedBox(
      height: 50,
      child: Container(
        child: ListView.builder(
            itemCount: listCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => debugPrint('${listCategory[index]} Tapped'),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Theme.of(context).accentColor)),
                  child: Text(
                    listCategory[index].categoryType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 14),
                  ),
                ),
              );
            }),
      ));
}

Widget topSpace() {
  return SizedBox(height: 15);
}
