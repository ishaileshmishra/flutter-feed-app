// Bloc Pattern for the feed.

//TODO: Imports
//TODO: List of Feeds
//TODO: Stream controller
//TODO: Stream sink getter
//TODO: Constructor - Add Likes, Listen to the changes
//TODO: Core functions
//TODO: Dispose

//Stream Is Already Been Cooked In Flutter

import 'dart:async';
import 'package:healthnest/categories/feed/feed_model.dart';
import 'feed.dart';

class FeedBloc {

  static String _descriptionIsLong =
      "I have been facing a facing possible symptoms of skin cancer. "
      "I have googled all possibilities but i thought i'd asked community instead...";

  // 1. list of feeds done
  List<Feed> _feedList = [


    Feed(
        1,
        'rohit.shetty02',
        _descriptionIsLong,
        'Entertainment',
        'Asked a question',
        '2:29',
        'What Are The Sign And Symptoms Of Skin Cancer !',
        'https://www.w3schools.com/w3images/avatar1.png',
        'https://www.w3schools.com/w3images/avatar1.png',
        'Peninsula park Andheri, Mumbai',
        23,
        '2',
        '12'),
    Feed(
        2,
        'sunil.shetty32',
        _descriptionIsLong,
        'Entertainment',
        'Created an event',
        '2:29',
        'Something to motivate you',
        'https://www.w3schools.com/w3images/avatar2.png',
        'https://www.w3schools.com/w3images/avatar2.png',
        'J.B Nagar Andheri, Mumbai',
        223,
        '2',
        '12'),
    Feed(
        3,
        'ishaileshmishra',
        _descriptionIsLong,
        'Entertainment',
        'Created for intertainment',
        '2:29',
        'What Are The best hhospitals in india for Cancer !',
        'https://www.w3schools.com/w3images/avatar3.png',
        'https://www.w3schools.com/w3images/avatar3.png',
        'Ramangar, Vasai, Mumbai',
        53,
        '2',
        '12'),
    Feed(
        4,
        'whoisshailesh92',
        _descriptionIsLong,
        'Entertainment',
        'Love and afairs',
        '2:29',
        'What Are The Sign And Symptoms Of Skin Cancer !',
        'https://www.w3schools.com/w3images/avatar4.png',
        'https://www.w3schools.com/w3images/avatar4.png',
        'Bangar Kalan, Gonregaon E Mumbai',
        120,
        '2',
        '12'),
    Feed(
        5,
        'shaileshkumar42',
        _descriptionIsLong,
        'Entertainment',
        'Asked a question',
        '2:29',
        'What Are The Sign And Symptoms Of Skin Cancer !',
        'https://www.w3schools.com/w3images/avatar5.png',
        'https://www.w3schools.com/w3images/avatar5.png',
        'Location not given, Mumbai',
        230,
        '2',
        '12'),
    Feed(
        6,
        'swami.vivekanand23',
        _descriptionIsLong,
        'Entertainment',
        'Motivation',
        '2:29',
        'What Are The Sign And Symptoms Of Skin Cancer !',
        'https://www.w3schools.com/w3images/avatar5.png',
        'https://www.w3schools.com/w3images/avatar6.png',
        'Cigrate factory, Chakala, Mumbai',
        423,
        '2',
        '12'),
  ];

  // 2. Stream controller
  final _feedListStreamController = StreamController<List<Feed>>();
  final _feedLikeIncrementController = StreamController<Feed>();
  final _feedLikeDecrementController = StreamController<Feed>();


  // 3. Stream Sink Getter
  Stream<List<Feed>> get feedListStream => _feedListStreamController.stream;
  StreamSink<List<Feed>> get feedListSink  => _feedListStreamController.sink;

  StreamSink<Feed> get feedLikeIncrement  => _feedLikeIncrementController.sink;
  StreamSink<Feed> get feedLikeDecrement  => _feedLikeDecrementController.sink;

  // Constructor
  FeedBloc(){
    _feedListStreamController.add(_feedList);
    _feedLikeIncrementController.stream.listen(_incrementLike);
    _feedLikeDecrementController.stream.listen(_decrementLike);
  }


  // Core Functions
  _incrementLike(Feed feed){
    int like = feed.likes;
    int incrementLike = like+1;
    _feedList[feed.feedId -1].likes = like + incrementLike;
    feedListSink.add(_feedList);
  }

  _decrementLike(Feed feed){
    int like = feed.likes;
    int decrementLike = like-1;
    _feedList[feed.feedId -1].likes = like - decrementLike;
    feedListSink.add(_feedList);
  }


  // dispose.
  dispose(){
    _feedLikeDecrementController.close();
    _feedLikeIncrementController.close();
    _feedListStreamController.close();

  }

}
