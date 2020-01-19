import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/categories/feed/category_list.dart';
import 'package:healthnest/categories/feed/feed_model.dart';
import 'package:healthnest/categories/feed/widgetFeed.dart';
import 'package:healthnest/ui/FeedLatestArticle.dart';
import 'package:healthnest/widget/feedCard.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List<Feed> _feedList = [
    Feed(
        feedId: 1,
        type: 0,
        title: 'rohit.shetty12',
        description:
            'I have been facing a few possible symptoms of skin cancer. I have googled the possibilities but i can thought i did asked the community instead...',
        category: 'DIET',
        subcategory: 'Asked a question',
        time: '1 min',
        name: 'What Are The Sign And Symptoms Of Skin Cancer?',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 24,
        comments: '24',
        members: '24'),
    Feed(
        feedId: 2,
        type: 0,
        title: 'rohit.shetty02',
        description:
            'My husband has his 3 days transpalnt assessment in Newcastle next month, strange mix of emotions. for those that have been thought this how long did it take following assessment was it intil you were t...',
        category: 'DIET',
        subcategory: 'Asked a question',
        time: '10 min',
        name: '',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),
    Feed(
        feedId: 3,
        type: 0,
        title: 'username1275',
        description: '',
        category: 'DIET',
        subcategory: 'Asked a question',
        time: '10 min',
        name: 'Cancer Meet At Rajiv Gandhi National Park',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),
    Feed(
        feedId: 4,
        type: 0,
        title: 'super987',
        description: '#itsokeyto #cancerserviver',
        category: 'LIFESTYLE',
        subcategory: 'Asked a question',
        time: '10 min',
        name: 'Something To Motivate You',
        avatarImg: 'https://www.w3schools.com/w3images/avatar4.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar4.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 25,
        comments: '24',
        members: '18'),
    Feed(
        feedId: 5,
        type: 0,
        title: 'username1275',
        description: '#itsokeyto #cancerserviver',
        category: 'LIFESTYLE',
        subcategory: 'created a poll',
        time: '1 min',
        name: 'What is the best hospital in india for the cancer?',
        avatarImg: 'https://www.w3schools.com/w3images/avatar4.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar4.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 25,
        comments: '24',
        members: '18'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          child: SafeArea(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        actionBarRow(),
                        topSpace(),
                        searchTextField(),
                        topSpace(),
                        Container(height: 55, child: CategoryList()),
                      ],
                    ),
                  ),
                ),

                topSpace(),

                // List section for the News Feed.
                feedNewsCardItem(_feedList[0]),
                feedNewsCardItem(_feedList[1]),
                feedNewsCardItemQuestion(_feedList[2]),
                feedNewsCardWithImageItem(_feedList[3]),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('LATEST ARTICLE',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                topSpace(),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: LatestArticle(),
                ),

                pollingCard(_feedList[4]),
                feedNewsCardItem(_feedList[1]),
              ],
            ),


          ),
        ),
      ),
    );
  }

  Widget feedNewsCardItem(Feed feed) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            renderCategoryTime(feed),
            space10(),
            userAvatarSection(context, feed),
            space15(),
            Visibility(
                visible: feed.name.isEmpty == true ? false : true,
                child: Text(feed.name,
                    softWrap: true,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            space15(),
            Visibility(
                visible: feed.description.isEmpty == true ? false : true,
                child: Text(feed.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey))),
            space15(),
            setLocation(feed),
            Divider(thickness: 1),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.addressBook),
                SizedBox(width: 10),
                Text(
                  '${feed.members} Members have this questions',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Divider(thickness: 1),
            SizedBox(height: 10),
            likeCommentShare(feed),
            space15(),
          ],
        ),
      ),
    );
  }

  Widget feedNewsCardItemQuestion(Feed feed) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            renderCategoryTime(feed),
            space10(),
            userAvatarSection(context, feed),
            space15(),
            Visibility(
                visible: feed.name.isEmpty == true ? false : true,
                child: Text(feed.name,
                    softWrap: true,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            space15(),
            setLocation(feed),
            space15(),
            questionPallet(),
            space15(),
            Divider(thickness: 1),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.addressBook),
                SizedBox(width: 10),
                Text(
                  '${feed.members} Members have this questions',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Divider(thickness: 1),
            SizedBox(height: 10),
            likeCommentShare(feed),
            space15(),
          ],
        ),
      ),
    );
  }

  Widget feedNewsCardWithImageItem(Feed feed) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            renderCategoryTime(feed),
            space10(),
            userAvatarSection(context, feed),
            space15(),
            Text(feed.name,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            space15(),
            Text(feed.description,
                style: TextStyle(fontSize: 14, color: Colors.blue)),
            space15(),
            // show Image Preview

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/running_girl.jpeg')
                ),
              ),
              child: Image(
                  image: new AssetImage('assets/img/running_girl.jpeg'),
                  fit: BoxFit.cover)//Image.asset('assets/img/running_girl.jpeg', fit: BoxFit.cover, height: 180, width: 600),
            ),

            space15(),
            // shows location
            setLocation(feed),
            Divider(thickness: 1),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.addressBook),
                SizedBox(width: 10),
                Text(
                  '${feed.members} Members have this questions',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Divider(thickness: 1),
            SizedBox(height: 10),
            likeCommentShare(feed),
            space15(),
          ],
        ),
      ),
    );
  }

  Widget btnDecoration(String btnText) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.teal,
        ),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 12, color: Colors.grey[100]),
        ));
  }

  Widget questionPallet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      decoration: BoxDecoration(color: Colors.teal[100]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Are you going?', style: TextStyle(fontSize: 18)),
              Row(
                children: <Widget>[
                  Icon(Icons.people),
                  SizedBox(
                    width: 4,
                  ),
                  Text('21 People going?', style: TextStyle(fontSize: 12))
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              btnDecoration('No'),
              SizedBox(width: 20),
              btnDecoration('Yes')
            ],
          )
        ],
      ),
    );
  }

  Widget pollingCard(Feed feed) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            renderCategoryTime(feed),
            space10(),
            userAvatarSection(context, feed),
            space15(),
            Visibility(
                visible: feed.name.isEmpty == true ? false : true,
                child: Text(feed.name,
                    softWrap: true,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            space15(),
            pollCartSection(),
            space15(),
            setLocation(feed),
            Divider(thickness: 1),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.addressBook),
                SizedBox(width: 10),
                Text(
                  'You and ${feed.members} Members Liked this poll',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Divider(thickness: 1),
            SizedBox(height: 10),
            likeCommentShare(feed),
            space15(),
          ],
        ),
      ),
    );
  }

  Widget pollCartSection() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            pollQuestion('Apollo Hospital, Banglore'),
            pollQuestion('20%'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            pollQuestion('AIIMS Delhi'),
            pollQuestion('20%'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            pollQuestion('Kokila Ben Dhirubhai Ambani, Mumbai'),
            pollQuestion('50%')
          ],
        )
      ],
    );
  }

  Widget pollQuestion(String question) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Text(question),
    );
  }
}
