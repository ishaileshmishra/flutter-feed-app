import 'package:flutter/material.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/category_list.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/feedBloc.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/widgetFeed.dart';
import 'package:healthnest/ui/newsFeedPage/FeedLatestArticle.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        actionBarRow(),
                        topSpace(),
                        searchTextField(),
                        topSpace(),
                        Container(height: 55, child: CategoryList()),
                      ],
                    ),
                  ),
                ),

                topSpace(),

                // List section for the News Feed.
                feedNewsCardItem(context, FeedBloc().feedList[0]),

                feedNewsCardItem(context, FeedBloc().feedList[1]),

                feedNewsCardItemQuestion(context, FeedBloc().feedList[2]),

                feedNewsCardWithImageItem(context, FeedBloc().feedList[3]),

                SizedBox(height: 20),

                Container(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('LATEST ARTICLE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),

                topSpace(),

                Container(height: 200, padding: EdgeInsets.all(10), child: LatestArticle()),

                pollingCard(context, FeedBloc().feedList[4]),

                feedNewsCardItem(context, FeedBloc().feedList[1]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
