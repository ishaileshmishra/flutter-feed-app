import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
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
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey)),
                      Text('All Communities',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal)),
                    ],
                  ),
                  CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                            'https://in.bmscdn.com/iedb/artist/images/website/poster/large/rajkummar-rao-1043890-20-12-2017-03-34-28.jpg'),
                      ),
                      radius: 25,
                      //backgroundColor: Colors.grey[300],
                      backgroundColor: Colors.transparent)
                ],
              ),
              SizedBox(height: 20),

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
                          borderSide: new BorderSide(color: Colors.grey[300], width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(FontAwesomeIcons.bell, size: 25,))
                ],
              ),


              SizedBox(height: 20),


              SizedBox(height: 45, child: Container(
               child: ListView.builder(
                   itemCount: 10 ,
                   scrollDirection: Axis.horizontal,
                   physics: BouncingScrollPhysics(),
                   itemBuilder: (context, index) {
                     return Container(
                       padding: EdgeInsets.all(10),
                       margin: EdgeInsets.all(4),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                         border: Border.all(
                             width: 1,
                             style: BorderStyle.solid,
                             color: Theme.of(context).accentColor)

                       ),

                       child: Text('All Posts', style: TextStyle(color: Theme.of(context).accentColor),),

                 );
               }),
              )),


            ],
          ),
        ),
      ),
    );
  }
}
