import 'package:flutter/material.dart';
import 'package:healthnest/postpage/widgets.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/feedBloc.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/widgetFeed.dart';

class PostPageDetails extends StatefulWidget {

  PostPageDetails({Key key}) : super(key: key);

  @override
  _PostPageDetailsState createState() => _PostPageDetailsState();
}

class _PostPageDetailsState extends State<PostPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Questions'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[

              feedNewsCardItem(context, FeedBloc().feedList[1]),

              //Reply and comment 1
              SizedBox(height: 30),
              othersComment(context, FeedBloc().feedList[2]),

              //Reply and comment 1
              SizedBox(height: 30),
              othersCommentWithImageSlider(context, FeedBloc().feedList[2]),

              //Reply and comment 1
              SizedBox(height: 30),
              othersComment(context, FeedBloc().feedList[2]),


              SizedBox(height: 30),
              othersComment(context, FeedBloc().feedList[2]),


              SizedBox(height: 30),
              commentReply(context, FeedBloc().feedList[2]),


              SizedBox(height: 30),
              othersComment(context, FeedBloc().feedList[2]),


              SizedBox(height: 30),
              othersCommentWithImageSlider(context, FeedBloc().feedList[2]),

              SizedBox(height: 30),
              othersComment(context, FeedBloc().feedList[2]),

            ],
          ),
        ),
      ),
    );
  }
}
