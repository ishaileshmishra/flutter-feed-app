import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthnest/categories/feed/category_list.dart';
import 'package:healthnest/categories/feed/feedBloc.dart';
import 'package:healthnest/categories/feed/feed_model.dart';
import 'package:healthnest/categories/feed/widgetFeed.dart';
import 'package:healthnest/widget/feedCard.dart';

class FeedPage extends StatefulWidget {

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final FeedBloc feedBloc = FeedBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    feedBloc.dispose();
    super.dispose();
  }


  Widget streamBuilderLayout() {
    return StreamBuilder<List<Feed>>(
      stream: feedBloc.feedListStream,
      builder: (BuildContext context, AsyncSnapshot<List<Feed>> snapshot) {
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              if (!snapshot.hasData) {
                return Center(
                    child: Text('Feed Does not have data',
                        style: TextStyle(fontSize: 20, color: Colors.red)));
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error While Fetching Feeds',
                        style: TextStyle(fontSize: 20, color: Colors.red)));
              } else {
                return feedCard(context, snapshot.data[index]);
              }
            });
      },
    );
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
              Container(height: 55, child: CategoryList()),
              topSpace(),
              Expanded(
                child: Container(
                  child: streamBuilderLayout(),
                ),
                //child: FeedItemCard()
              ),
            ],
          ),
        ),
      ),
    );
  }


}
