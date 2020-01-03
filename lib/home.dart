import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthnest/categories/feed.dart';
import 'package:healthnest/categories/library.dart';
import 'package:healthnest/categories/messages.dart';
import 'package:healthnest/categories/services.dart';
import 'package:healthnest/navigation/fab_bottom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPostModel {
  String title;
  String subTitle;
  IconData iconData;

  NewPostModel({this.title, this.subTitle, this.iconData});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  int _selectedDrawerIndex = 0;

  _selectedTab(int pos) {

    setState(() {
      _onSelectItem(pos);
    });

    switch (pos) {
      case 0:
        return FeedPage();
      case 1:
        return LibraryPage();
      case 2:
        return MessagesPage();
      case 3:
        return ServicePage();
      default:
        return Text("Error");
    }

  }


  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _selectedTab(_selectedDrawerIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedTab(_selectedDrawerIndex),//Center(child: Text('Selected TAB $_lastSelected', style: TextStyle(fontSize: 32.0))),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Post',
        onPressed: _showModal,
        child: Icon(CupertinoIcons.add),
        elevation: 10,
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Theme.of(context).accentColor,
        notchedShape: CircularNotchedRectangle(),
        iconSize: 20.0,
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: FontAwesomeIcons.listAlt, text: 'Feed'),
          FABBottomAppBarItem(iconData: FontAwesomeIcons.book, text: 'Library'),
          FABBottomAppBarItem(iconData: FontAwesomeIcons.comments, text: 'Messages'),
          FABBottomAppBarItem(iconData: FontAwesomeIcons.userFriends, text: 'Services'),
        ],
      ),
    );
  }

  void _showModal() {
    final List<NewPostModel> listModel = [
      NewPostModel(
          title: 'Create a post',
          subTitle: 'Share your thoughts with community',
          iconData: FontAwesomeIcons.pen),
      NewPostModel(
          title: 'Ask a Question',
          subTitle: 'Any doubts? As the community',
          iconData: FontAwesomeIcons.info),
      NewPostModel(
          title: 'Start a Poll',
          subTitle: 'Need the option of the many ?',
          iconData: FontAwesomeIcons.poll),
      NewPostModel(
          title: 'Organise an Event',
          subTitle: 'Start meet with people to share your joys',
          iconData: FontAwesomeIcons.calendar),
    ];

    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 420,
            margin: EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: listModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => print(listModel[index].title),
                    title: Text(listModel[index].title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).accentColor,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold)),
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                      child: Icon(listModel[index].iconData, size: 15.0),
                    ),
                    subtitle: Text(listModel[index].subTitle),
                    contentPadding: EdgeInsets.all(12),
                    trailing: Icon(CupertinoIcons.forward),
                  );
                }));
      },
    );
    future.then((void value) => _closeModal(value));
  }

  void _closeModal(void value) {
    print('modal closed');
  }
}
