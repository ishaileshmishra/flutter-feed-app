import 'package:flutter/material.dart';
import 'package:healthnest/postpage/widgets.dart';

class PostPageDetails extends StatefulWidget {
  PostPageDetails({Key key}) : super(key: key);

  @override
  _PostPageDetailsState createState() => _PostPageDetailsState();
}

class _PostPageDetailsState extends State<PostPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Questions')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              FeedCard(context)

            ],
          ),
        ),
      ),
    );
  }
}
