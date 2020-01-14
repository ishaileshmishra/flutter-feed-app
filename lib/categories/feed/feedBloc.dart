// Bloc Pattern for the feed.

// TODO: Imports
// TODO: List of Feeds
// TODO: Stream controller
// TODO: Stream sink getter
// TODO: Constructor - Add Likes, Listen to the changes
// TODO: Core functions
// TODO: Dispose

//Stream Is Already Been Cooked In Flutter
import 'dart:async';
import 'package:healthnest/categories/feed/feed_model.dart';

class FeedBloc {

  static String _descriptionIsLong = "I have been facing a facing possible symptoms of skin cancer. "
      "I have googled all possibilities but i thought i'd asked community instead...";

  List<Feed> _feedList = [
    //this.feedId, this.title, this.description, this.category, this.subcategory, this.time, this.name, this.avatarImg, this.bannerImg, this.location, this.likes, this.comments, this.members
    Feed(
        feedId: 1,
        type: 0,
        title: 'rohit.shetty02',
        description: _descriptionIsLong,
        category: 'Entertainment',
        subcategory: 'Asked a question',
        time: '21:29',
        name: 'What Are The Sign And Symptoms Of Skin Cancer cnwecnejcnejcn !',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),
    Feed(
        feedId: 2,
        type: 1,
        title: '',
        description: _descriptionIsLong,
        category: 'Entertainment',
        subcategory: 'Asked a question',
        time: '21:29',
        name: 'What Are The Sign And Symptoms Of Skin Cancer cnwecnejcnejcn !',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),
    Feed(
        feedId: 3,
        type: 0,
        title: 'rohit.shetty02',
        description: _descriptionIsLong,
        category: 'Entertainment',
        subcategory: 'Asked a question',
        time: '21:29',
        name: 'What Are The Sign And Symptoms Of Skin Cancer cnwecnejcnejcn !',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),
    Feed(
        feedId: 4,
        type: 0,
        title: 'rohit.shetty02',
        description: _descriptionIsLong,
        category: 'Entertainment',
        subcategory: 'Asked a question',
        time: '21:29',
        name: 'What Are The Sign And Symptoms Of Skin Cancer cnwecnejcnejcn !',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),
    Feed(
        feedId: 5,
        type: 0,
        title: 'rohit.shetty02',
        description: _descriptionIsLong,
        category: 'Entertainment',
        subcategory: 'Asked a question',
        time: '21:29',
        name: 'What Are The Sign And Symptoms Of Skin Cancer cnwecnejcnejcn !',
        avatarImg: 'https://www.w3schools.com/w3images/avatar1.png',
        bannerImg: 'https://www.w3schools.com/w3images/avatar1.png',
        location: 'Peninsula park Andheri, Mumbai',
        likes: 23,
        comments: '2',
        members: '12'),

  ];

  // 2. Stream controller
  final _feedListStreamController = StreamController<List<Feed>>();
  final _feedLikeIncrementController = StreamController<Feed>();
  final _feedLikeDecrementController = StreamController<Feed>();

  // 3. Stream Sink Getter
  Stream<List<Feed>> get feedListStream => _feedListStreamController.stream;
  StreamSink<List<Feed>> get feedListSink => _feedListStreamController.sink;

  StreamSink<Feed> get feedLikeIncrement => _feedLikeIncrementController.sink;
  StreamSink<Feed> get feedLikeDecrement => _feedLikeDecrementController.sink;

  // Constructor
  FeedBloc() {
    _feedListStreamController.add(_feedList);
    _feedLikeIncrementController.stream.listen(_incrementLike);
    _feedLikeDecrementController.stream.listen(_decrementLike);
  }

  _incrementLike(Feed feed) {
    int like = feed.likes;
    int incrementLike = like + 1;
    _feedList[feed.feedId - 1].likes = like + incrementLike;
    feedListSink.add(_feedList);
  }

  _decrementLike(Feed feed) {
    int like = feed.likes;
    int decrementLike = like - 1;
    _feedList[feed.feedId - 1].likes = like - decrementLike;
    feedListSink.add(_feedList);
  }

  dispose() {
    _feedLikeDecrementController.close();
    _feedLikeIncrementController.close();
    _feedListStreamController.close();
  }
}
