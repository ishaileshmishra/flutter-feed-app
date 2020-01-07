import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/categories/feed/feed_model.dart';
import 'package:healthnest/postpage/postdetail_page.dart';
import 'package:share/share.dart';

class FeedItemCard extends StatelessWidget {

  const FeedItemCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String avatarCircle = 'https://www.w3schools.com/w3images/avatar5.png';

    return ListView.builder(
        itemCount: 21,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PostPageDetails())),
              child: Container(
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
                                            backgroundColor:
                                            Theme.of(context).primaryColor,
                                            child: ClipOval(
                                                child: Image.network(
                                                    avatarCircle)),
                                            radius: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      print('Comment tapped');
                                      //showOptions();
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.comment,
                                          size: 18,
                                        ),
                                        SizedBox(width: 5),
                                        Text('${index * 3}')
                                      ],
                                    ))
                              ]),
                          Icon(FontAwesomeIcons.bookmark, size: 18),
                          GestureDetector(
                              onTap: () {
                                Share.share(
                                    'check out my website https://example.com');
                              },
                              child: Icon(FontAwesomeIcons.shareAlt, size: 18))
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  )),
            ),
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
}





Widget actionBarRow() {

  String circleAvatar = 'https://www.w3schools.com/w3images/avatar3.png';
  return Row(
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
          child: ClipOval(child: Image.network(circleAvatar)), radius: 25,
          backgroundColor: Colors.grey[300]
      )
    ],
  );
}




Widget searchTextField() {
  return Row(
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
              borderSide: new BorderSide(color: Colors.grey[300], width: 0.5),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        child: Icon(FontAwesomeIcons.bell, size: 26),
      )
    ],
  );
}

Widget horizontalCategories() {

  // horizontal category list
  List<Category> listCategory = [
    Category(categoryType: 'All posts'),
    Category(categoryType: 'News'),
    Category(categoryType: 'Doctor'),
    Category(categoryType: 'Lifestyle'),
    Category(categoryType: 'Symptom'),
    Category(categoryType: 'Entertainment'),
    Category(categoryType: 'Love'),
  ];

  return SizedBox(
      height: 50,
      child: Container(
        child: ListView.builder(
            itemCount: listCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()=> debugPrint('${listCategory[index]} Tapped'),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Theme.of(context).accentColor)),
                  child: Text(
                    listCategory[index].categoryType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 14),
                  ),
                ),
              );
            }),
      ));
}

Widget topSpace() {
  return SizedBox(height: 15);
}
