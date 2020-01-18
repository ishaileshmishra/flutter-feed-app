import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LatestArticleModel {
  String imageIcon;
  String DrName;
  String DrDescription;

  LatestArticleModel({this.imageIcon, this.DrName, this.DrDescription});
}

class LatestArticle extends StatefulWidget {
  @override
  _LatestArticleState createState() => _LatestArticleState();
}

class _LatestArticleState extends State<LatestArticle> {
  List<LatestArticleModel> articleModel = new List<LatestArticleModel>();

  @override
  void initState() {
    super.initState();

    articleModel.add(LatestArticleModel(
        imageIcon: 'https://www.w3schools.com/w3images/avatar2.png',
        DrName: 'Dr. Shukla',
        DrDescription:
            'Generic testing plays an important role in preventing the cancer orem ipsum...'));
    articleModel.add(LatestArticleModel(
        imageIcon: 'https://www.w3schools.com/w3images/avatar3.png',
        DrName: 'Dr. Mishra',
        DrDescription:
            'Generic testing plays an important role in preventing the cancer orem ipsum...'));
    articleModel.add(LatestArticleModel(
        imageIcon: 'https://www.w3schools.com/w3images/avatar5.png',
        DrName: 'Dr. Tripathi',
        DrDescription:
            'Generic testing plays an important role in preventing the cancer orem ipsum...'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articleModel.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: Container(
              height: 200,
              width: 300,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: ClipOval(
                              child:
                                  Image.network(articleModel[index].imageIcon)),
                          radius: 20),
                      SizedBox(width: 10),
                      Text(articleModel[index].DrName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Text(articleModel[index].DrDescription,
                      maxLines: 3, style: TextStyle(fontSize: 15)),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('READ ARTICLE',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal)),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.teal,
                      )
                    ],
                  ),

                ],
              ),
            ),
          );
        });
  }
}
