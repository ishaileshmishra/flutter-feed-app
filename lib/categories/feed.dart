import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/models/Feeds.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('COMMUNITY',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey)),
                      Row(
                        children: <Widget>[
                          Text('All Communities',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal)),
                          SizedBox(width: 6),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.teal,
                          )
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                            'https://in.bmscdn.com/iedb/artist/images/website/poster/large/rajkummar-rao-1043890-20-12-2017-03-34-28.jpg'),
                      ),
                      radius: 20,
                      //backgroundColor: Colors.grey[300],
                      backgroundColor: Colors.transparent)
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      decoration: new InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.search),
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Search posts and members',
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                          borderSide: new BorderSide(
                              color: Colors.grey[300], width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Icon(FontAwesomeIcons.bell, size: 26),
                  )
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                  height: 50,
                  child: Container(
                    child: ListView.builder(
                        itemCount: Feeds().listCategory.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                final category =
                                    Feeds().listCategory[index].categoryType;
                                final snackBar = SnackBar(
                                    content: Text('Yay! $category Tapped!'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () => print('object'),
                                    ));
                                Scaffold.of(context).showSnackBar(snackBar);
                                print(category);
                                //Feeds().listCategory[index].isSelected = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Theme.of(context).accentColor)),
                              child: Text(
                                Feeds().listCategory[index].categoryType,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 14),
                              ),
                            ),
                          );
                        }),
                  )),
              SizedBox(height: 15),
              Expanded(child: FeedItem()),
            ],
          ),
        ),
      ),
    );
  }
}
