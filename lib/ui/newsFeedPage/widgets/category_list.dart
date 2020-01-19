import 'package:flutter/material.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/widgetFeed.dart';

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
