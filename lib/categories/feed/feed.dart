import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthnest/blocks/Feed.dart';
import 'package:healthnest/categories/feed/widgetFeed.dart';
import 'package:healthnest/widgets/feed_item.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
  }


  Widget horizontalCategories() {
    return SizedBox(
        height: 50,
        child: Container(
          child: ListView.builder(
              itemCount: Feeds().listCategory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      final category = Feeds().listCategory[index].categoryType;
                      final snackBar = SnackBar(
                          content: Text('Yay! $category Tapped!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () => print('object'),
                          ));
                      Scaffold.of(context).showSnackBar(snackBar);
                      print(category);
                    });
                  },
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
                      Feeds().listCategory[index].categoryType,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 14),
                    ),
                  ),
                );
              }),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              actionBarRow(),
              topSpace(),
              searchTextField(),
              topSpace(),
              horizontalCategories(),
              topSpace(),
              Expanded(child: FeedItem()),
            ],
          ),
        ),
      ),
    );
  }
}
