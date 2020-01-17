import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthnest/categories/feed/feed.dart';
import 'package:healthnest/categories/library/library.dart';
import 'package:healthnest/categories/message/messages.dart';
import 'package:healthnest/categories/services/services.dart';
import 'package:healthnest/navigation/fab_bottom_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/ui/NewsFeed.dart';

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
        return NewsFeed();//FeedPage();
      case 1:
        return LibraryPage();
      case 2:
        return MessagesPage();
      case 3:
        return ServicePage();
      default:
        return Text("Invalid screen requested");
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

      body: _selectedTab(_selectedDrawerIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Post',
        splashColor: Colors.teal,
        onPressed: _onCenterBottomFloatingPressed,
        child: Icon(CupertinoIcons.add),
        elevation: 10,
      ),

      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey[700],
        selectedColor: Theme.of(context).accentColor,
        notchedShape: CircularNotchedRectangle(),
        iconSize: 20.0,
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: FontAwesomeIcons.listAlt, text: 'Feed'),
          FABBottomAppBarItem(iconData: FontAwesomeIcons.book, text: 'Library'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.comments, text: 'Messages'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.businessTime, text: 'Services'),
        ],
      ),
    );
  }

  _onCenterBottomFloatingPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: _buildBottomNavMenu(),
          );
        });
  }


  Widget divider(){
    return Divider(
      height: 1,
      color: Colors.grey[500],
    );
  }


  Widget _buildBottomNavMenu() {

    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.teal[200],
              ),
              child: Icon(Icons.colorize),
            ), //Icon(FontAwesomeIcons.penFancy, size: 20),
            title: Text('Create New Post'),
            subtitle: Text('This is subtitle'),
            onTap: () {
              Navigator.pop(context);
              debugPrint('Create New Post');
            },
          ),


          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.teal[200],
              ),
              child: Icon(FontAwesomeIcons.info),
            ), //Icon(FontAwesomeIcons.info),
            title: Text('Ask A Question'),
            subtitle: Text('Ask A Question'),
            onTap: () {
              Navigator.pop(context);
              debugPrint('Create New Post');
            },
          ),


          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.teal[200],
              ),
              child: Icon(Icons.poll),
            ),
            title: Text('Start A Poll'),
            subtitle: Text('Start A Poll'),
            onTap: () {
              Navigator.pop(context);
              debugPrint('Create New Post');
            },
          ),

          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.teal[200],
              ),
              child: Icon(Icons.event),
            ),
            title: Text('Organise An Event'),
            subtitle: Text('Organise An Event'),
            onTap: () {
              Navigator.pop(context);
              debugPrint('Create New Post');
            },
          )
        ],
      ),
    );
  }
}
