import 'package:healthnest/models/feed_models.dart';

class Feeds {
//  this.title, this.description, this.category, this.subcategory,
//  this.time, this.name, this.avatarImg, this.bannerImg, this.location,
//  this.likes, this.comments, this.members

  List<FeedModel> feedList = [
    FeedModel(title: 'rohit.shetty12', description: '', category: '', subcategory: '', time: '', name: '', avatarImg: '', bannerImg: '', location: '', likes: '', comments: '', members: ''),
    FeedModel(title: 'ishaileshmishra', description: '', category: '', subcategory: '', time: '', name: '', avatarImg: '', bannerImg: '', location: '', likes: '', comments: '', members: ''),
    FeedModel(title: 'narendramodi09', description: '', category: '', subcategory: '', time: '', name: '', avatarImg: '', bannerImg: '', location: '', likes: '', comments: '', members: ''),
    FeedModel(title: 'strams.example02', description: '', category: '', subcategory: '', time: '', name: '', avatarImg: '', bannerImg: '', location: '', likes: '', comments: '', members: ''),
    FeedModel(title: 'be.spritual01', description: '', category: '', subcategory: '', time: '', name: '', avatarImg: '', bannerImg: '', location: '', likes: '', comments: '', members: ''),
  ];

  List<Category> listCategory = [
    Category(categoryType: 'All posts'),
    Category(categoryType: 'News'),
    Category(categoryType: 'Doctor'),
    Category(categoryType: 'Lifestyle'),
    Category(categoryType: 'Symptom'),
    Category(categoryType: 'Entertainment'),
    Category(categoryType: 'Love'),
  ];
}
