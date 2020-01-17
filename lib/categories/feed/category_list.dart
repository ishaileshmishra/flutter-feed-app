import 'package:flutter/material.dart';
import 'package:healthnest/categories/feed/widgetFeed.dart';

class CategoryList extends StatefulWidget {

  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  List<String> listCategory = [
    'All posts',
    'News',
    'Doctor',
    'Lifestyle',
    'Symptom',
    'Entertainment',
    'Love'
  ];


//  BoxDecoration boxDecoration() {
//    return BoxDecoration(
//        borderRadius: BorderRadius.all(Radius.circular(30)),
//        border: Border.all(width: 1, style: BorderStyle.solid, color: Colors.teal));
//  }
//
//  BoxDecoration selectedBoxDecoration() {
//    return BoxDecoration(
//        borderRadius: BorderRadius.all(Radius.circular(30)),
//        color: Colors.teal[200],
//        border: Border.all(width: 1, style: BorderStyle.solid, color: Colors.teal));
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: listCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                debugPrint('${listCategory[index]} Tapped');
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: index == 0 ? selectedBoxDecoration() : boxDecoration(),
                child: Text(
                  listCategory[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.teal, fontSize: 14),
                ),
              ),
            );
          }),
    );
  }
}
