import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 21,
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
                      children: <Widget>[ Text(
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
                              GestureDetector(
                                onTap: () => _showPopupMenu(context),
                                child: Container(
                                  child: Icon(FontAwesomeIcons.ellipsisV,
                                      size: 18),
                                ),
                              )
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
                          'Park ${index + 1} Andheri East',
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
                              '${24 * index} members have this questions',
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
                              //showOptions();
                            },
                            child: Icon(
                              FontAwesomeIcons.thumbsUp,
                              size: 18,
                            )),
                        Icon(FontAwesomeIcons.comment, size: 18),
                        Icon(FontAwesomeIcons.bookmark, size: 18),
                        GestureDetector(
                            onTap: () {
                              print('share the feed Item');
                              Share.share(
                                  'check out my website https://example.com');
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

  _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 400, 100, 400),
      items: [
        
        PopupMenuItem(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.userTimes, size: 15),
            onTap: ()=> print('hide'),
            title: Text('Hide <Post type>'),
            subtitle: Text('See fewer posts like this'),
          ),
        ),
        
        PopupMenuItem(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.solidEyeSlash, size: 15,),
            onTap: ()=> print('Unfollow <username>'),
            title: Text('Unfollow <username>'),
            subtitle: Text('See fewer posts like this'),
          ),
        ),
        
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.report),
            onTap: ()=> print('Report'),
            title: Text('Report <Post type>'),
            subtitle: Text('See fewer posts like this'),
          ),
        ),

        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.link),
            onTap: ()=> print('hide'),
            title: Text('Copy <Post type> link'),
            subtitle: Text('See fewer posts like this'),
          ),
        ),

      ],
      elevation: 8.0,
    );
  }

  


}
