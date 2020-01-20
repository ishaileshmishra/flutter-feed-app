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
    Widget _buildMessageComposer() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        height: 70.0,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            Expanded(
                child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration:
                  InputDecoration.collapsed(hintText: 'Add a cheerful comment'),
            )),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Questions'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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

                _buildMessageComposer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
