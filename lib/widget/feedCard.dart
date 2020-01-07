import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/categories/feed/feed_model.dart';
import 'package:healthnest/postpage/postdetail_page.dart';
import 'package:share/share.dart';

Widget feedCard(BuildContext context, Feed listFeed) {

  return Card(
    child: GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostPageDetails())),
      child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    listFeed.name,
                    style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    listFeed.time,
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
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
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: ClipOval(
                                        child:
                                            Image.network(listFeed.avatarImg)),
                                    radius: 20),
                                SizedBox(width: 10),
                                Text(
                                  listFeed.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  listFeed.category,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Text(listFeed.category,
                                style: TextStyle(
                                    fontSize: 9,
                                    color: Theme.of(context).accentColor)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _showPopupMenu(context),
                          child: Container(
                            child: Icon(FontAwesomeIcons.ellipsisV, size: 18),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    'Park Andheri East',
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).accentColor),
                  ),
                ],
              ),
              Divider(thickness: 1),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.addressBook),
                  SizedBox(width: 10),
                  Text(
                    'Members have this questions',
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () => debugPrint('${listFeed.likes} tapped'),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.thumbsUp,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text('${listFeed.likes}')
                        ],
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => debugPrint('Comment Tapped'),
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.comment, size: 18),
                                SizedBox(width: 5),
                                Text(listFeed.comments)
                              ],
                            ))
                      ]),
                  Icon(FontAwesomeIcons.bookmark, size: 18),
                  GestureDetector(
                      onTap: () {
                        Share.share('check out my website https://example.com');
                      },
                      child: Icon(FontAwesomeIcons.shareAlt, size: 18))
                ],
              ),
              SizedBox(height: 15),
            ],
          )),
    ),
  );
}

_showPopupMenu(BuildContext context) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(100, 400, 100, 400),
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(FontAwesomeIcons.cross, size: 15),
          onTap: () => print('hide'),
          title: Text('Hide <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(
            FontAwesomeIcons.solidEyeSlash,
            size: 15,
          ),
          onTap: () => print('Unfollow <username>'),
          title: Text('Unfollow <username>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.report, size: 15),
          onTap: () => print('Report'),
          title: Text('Report <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.link, size: 15),
          onTap: () => print('hide'),
          title: Text('Copy <Post type> link'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
    ],
    elevation: 8.0,
  );
}
