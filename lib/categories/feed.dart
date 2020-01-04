import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/models/Feeds.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  String dropdownItem;

  @override
  void initState() {
    super.initState();
    dropdownItem = 'All Communities';
  }

  Widget _dropdown() {
    return DropdownButton<String>(
      items: <String>['All Communities', 'Diet', 'Love', 'Doctor']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {
        setState(() {
          dropdownItem = _;
        });

        Text(dropdownItem,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
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
                      Text('All Communities',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal)),
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
                    flex: 4,
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
                  Expanded(
                      flex: 1, child: Icon(FontAwesomeIcons.bell, size: 20))
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                  height: 45,
                  child: Container(
                    child: ListView.builder(
                        itemCount: Feeds().listCategory.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Feeds().listCategory[index].isSelected = true;
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

class FeedItem extends StatelessWidget {
  const FeedItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
                //margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'DIET',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          '1min',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        //backgroundColor: Theme.of(context).primaryColor,
                                        child: Image.network(
                                          'https://cdn0.iconfinder.com/data/icons/avatar-2/500/man-2-512.png',
                                          width: 80,
                                          height: 80,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'rohit.shetty12',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Asked a Question',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                  Text('DIAGONASED RECENTALLY',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color:
                                              Theme.of(context).accentColor)),
                                ],
                              ),
                              Icon(FontAwesomeIcons.ellipsisV, size: 18,)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'What are the sign and symptoms of Skin Cancer',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'I have been facing few possible symptom of skin cancer, I have googled the possibility but i thought to ask community',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).accentColor,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Pensulla Park Andheri East',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(height: 2),
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.picture_in_picture),
                            SizedBox(width: 20),
                            Text(
                              '24 members have this questions',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        )),
                    Divider(height: 2),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              print('Like tapped');
                              showOptions();
                            },
                            child: Icon(FontAwesomeIcons.thumbsUp, size: 18,)),
                        Icon(FontAwesomeIcons.comment, size: 18),
                        Icon(FontAwesomeIcons.bookmark, size: 18),
                        GestureDetector(
                            onTap: () {
                              print('share the feed');
                              SnackBar(
                                content: Text('Yay! A SnackBar!'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              //Share.text('my text title', 'This is my text to share with other applications.', 'text/plain');
                            },
                            child: Icon(FontAwesomeIcons.shareAlt, size: 18))
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                )),
          );
        });
  }

  void showOptions() {}

}
