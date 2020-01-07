import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthnest/categories/feed/widgetFeed.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  void initState() {
    super.initState();
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
              // Expand Feed ListView In The Available space.
              Expanded(child: FeedItemCard()),
            ],
          ),
        ),
      ),
    );
  }
}
