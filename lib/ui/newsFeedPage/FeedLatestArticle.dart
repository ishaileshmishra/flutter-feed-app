import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LatestArticleModel {

  String imageIcon;
  String drName;
  String drDescription;

  LatestArticleModel({this.imageIcon, this.drName, this.drDescription});
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
        drName: 'Dr. Shukla',
        drDescription:
            'Generic testing plays an important role in preventing the cancer orem ipsum...'));
    articleModel.add(LatestArticleModel(
        imageIcon: 'https://www.w3schools.com/w3images/avatar3.png',
        drName: 'Dr. Mishra',
        drDescription:
            'Generic testing plays an important role in preventing the cancer orem ipsum...'));
    articleModel.add(LatestArticleModel(
        imageIcon: 'https://www.w3schools.com/w3images/avatar5.png',
        drName: 'Dr. Tripathi',
        drDescription:
            'Generic testing plays an important role in preventing the cancer orem ipsum...'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articleModel.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(style: BorderStyle.solid, color: Colors.grey, width: 0.5)
            ),
            child: Card(
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
                        Text(articleModel[index].drName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text(articleModel[index].drDescription,
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
            ),
          );
        });
  }
}
