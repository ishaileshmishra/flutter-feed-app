import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/feedBloc.dart';
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
              renderCategoryTime(listFeed),
              space10(),
              userAvatarSection(context, listFeed),
              space15(),
              Text(listFeed.name,
                  softWrap: true,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              space15(),
              Text(listFeed.description, style: TextStyle(fontSize: 14, color: Colors.grey)),
              space15(),
              setLocation(listFeed),
              Divider(thickness: 1),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.addressBook),
                  SizedBox(width: 10),
                  Text(
                    '${listFeed.members} Members have this questions',
                    style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 10),
              likeCommentShare(listFeed),
              space15(),
            ],
          )),
    ),
  );
}

Widget likeCommentShare(Feed listFeed) {
  return Row(
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
  );
}

Widget setLocation(Feed listFeed) {
  return Row(
    children: <Widget>[
      Icon(Icons.location_on, color: Colors.teal),
      SizedBox(width: 15),
      Text(
        listFeed.location,
        style: TextStyle(fontSize: 12, color: Colors.teal),
      ),
    ],
  );
}

Widget userAvatarSection(BuildContext context, Feed listFeed) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: ClipOval(child: Image.network(listFeed.avatarImg)),
                    radius: 20),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(listFeed.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(listFeed.subcategory,
                            softWrap: true,
                            style: TextStyle(fontSize: 14, color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('DIAGNOSED RECENTALLY',
                        style: TextStyle(fontSize: 9, color: Colors.teal)),
                  ],
                )
              ],
            ),
            moreOptions3Dots(context),
          ],
        ),
      )
    ],
  );
}

Widget moreOptions3Dots(BuildContext context) {
  return GestureDetector(
    // Just For Demo, Doesn't Work As Needed
    onTap: () =>
        _onCenterBottomMenuOn3DotsPressed(context), //_showPopupMenu(context),
    child: Container(
      child: Icon(FontAwesomeIcons.ellipsisV, size: 18),
    ),
  );
}

Widget space10() {
  return SizedBox(height: 10);
}

Widget space15() {
  return SizedBox(height: 10);
}

Widget renderCategoryTime(Feed listFeed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(listFeed.category,
          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      Text(listFeed.time,
          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
    ],
  );
}

_onCenterBottomMenuOn3DotsPressed(BuildContext context) {
  //debugPrint('_buildBottomNavMenu');
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          child: _buildBottomNavMenu(context),
        );
      });
}

Widget _buildBottomNavMenu(BuildContext context) {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      color: Theme.of(context).canvasColor,
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(20),
        topRight: const Radius.circular(20),
      ),
    ),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(FontAwesomeIcons.cross, size: 15),
          onTap: () {
            print('hide');
            Navigator.pop(context);
          },
          title: Text('Hide <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
        Divider(
          height: 1,
          color: Colors.grey[500],
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.solidEyeSlash,
            size: 15,
          ),
          onTap: () {
            print('Unfollow <username>');
            Navigator.pop(context);
          },
          title: Text('Unfollow <username>'),
          subtitle: Text('See fewer posts like this'),
        ),
        Divider(
          height: 1,
          color: Colors.grey[500],
        ),
        ListTile(
          leading: Icon(Icons.report, size: 15),
          onTap: () {
            print('Report');
            Navigator.pop(context);
          },
          title: Text('Report <Post type>'),
          subtitle: Text('See fewer posts like this'),
        ),
        Divider(
          height: 1,
          color: Colors.grey[500],
        ),
        ListTile(
          leading: Icon(Icons.link, size: 15),
          onTap: () {
            debugPrint('Copy <Post type> link');
            Navigator.pop(context);
          },
          title: Text('Copy <Post type> link'),
          subtitle: Text('See fewer posts like this'),
        ),
      ],
    ),
  );
}
