
class Feed {

  int feedId, likes;
  String title, description, category, subcategory, time, name,
      avatarImg, bannerImg, location, comments, members;

  Feed(this.feedId, this.title, this.description,
      this.category, this.subcategory, this.time,
      this.name, this.avatarImg, this.bannerImg,
      this.location, this.likes, this.comments,
      this.members);
}



class Category {
  bool isSelected = false;
  String categoryType;

  Category({this.categoryType});
}