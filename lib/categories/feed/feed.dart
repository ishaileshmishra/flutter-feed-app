import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  void dispose() async{
    await feedBloc.dispose();
    super.dispose();
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
              Expanded(
                child: Container(
                  child: StreamBuilder<List<Feed>>(
                    stream: feedBloc.feedListStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Feed>> snapshot) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return feedCard(context, snapshot.data[index]);
                          });
                    },
                  ),
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
