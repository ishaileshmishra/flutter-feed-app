import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';


_showPopupMenu(BuildContext context) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(100, 400, 100, 400),
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(FontAwesomeIcons.userTimes, size: 15),
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
          leading: Icon(Icons.report),
          onTap: () => print('Report'),
          title: Text('Report <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.link),
          onTap: () => print('hide'),
          title: Text('Copy <Post type> link'),
          subtitle: Text('See fewer posts like this'),
        ),
      ),
    ],
    elevation: 8.0,
  );
}


Widget FeedCard(BuildContext context){

  return Card(
    child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('DIET', style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor),
                ),
                Text('1min',
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
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor:
                                Theme.of(context).primaryColor,
                                child: Image.network(
                                    'https://i.pinimg.com/736x/15/aa/70/15aa70d36d79f9969610636fe7fb02f2.jpg',
                                    width: 100,
                                    height: 100),
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
                                    color: Theme.of(context)
                                        .primaryColor),
                              ),
                            ],
                          ),
                          Text('DIAGONASED RECENTALLY',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Theme.of(context)
                                      .accentColor)),
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
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
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
                      fontSize: 12,
                      color: Theme.of(context).accentColor),
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
                      fontSize: 14,
                      color: Theme.of(context).primaryColor),
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
                    onTap: () {
                      print('Like tapped');
                      //showOptions();
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.thumbsUp,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text('12')
                      ],
                    )),
                Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            print('Comment tapped');
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.comment,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text('120')
                            ],
                          ))
                    ]),
                Icon(FontAwesomeIcons.bookmark, size: 18),
                GestureDetector(
                    onTap: () {
                      Share.share('check out my website https://example.com');
                    },
                    child:
                    Icon(FontAwesomeIcons.shareAlt, size: 18))
              ],
            ),
            SizedBox(height: 15),
          ],
        )),
  );

}


