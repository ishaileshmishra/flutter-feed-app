import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthnest/custom/fab_bottom_app_bar.dart';
import 'package:healthnest/ui/libraryPage/library.dart';
import 'package:healthnest/ui/messagePage/messages.dart';
import 'package:healthnest/ui/servicesPage/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthnest/ui/newsFeedPage/NewsFeed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedDrawerIndex = 0;
  List<MenuModel> bottomMenuItems = new List<MenuModel>();

  _selectedTab(int pos) {
    setState(() {
      _onSelectItem(pos);
    });

    switch (pos) {
      case 0:
        return NewsFeed();
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
    bottomMenuItems.add(new MenuModel('Create a post',
        'share your thoughts with the community', Icons.colorize));
    bottomMenuItems.add(new MenuModel(
        'Ask a Question', 'Any doubts? As the community', Icons.info));
    bottomMenuItems.add(new MenuModel(
        'Start a Poll', 'Need the opiniun of the many', Icons.equalizer));
    bottomMenuItems.add(new MenuModel('Organise an Event',
        'Start a meet with people to share your joys', Icons.event));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _selectedTab(_selectedDrawerIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Post',
        splashColor: Colors.teal,
        onPressed: _modalBottomSheetMenu,
        child: Icon(CupertinoIcons.add),
        elevation: 0,
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

  _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 440.0,
            color: Color(0xFF737373),
            child: Column(
              children: <Widget>[
                Container(
                  height: 300.0,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: new BoxDecoration(
                      color: Colors.white, //Color(0xFF737373),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: ListView.builder(
                      itemCount: bottomMenuItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.teal[100],
                            ),
                            child: Icon(
                              bottomMenuItems[index].icon,
                              color: Colors.teal,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                          title: Text(
                            bottomMenuItems[index].title,
                            style: TextStyle(color: Colors.teal, fontSize: 18),
                          ),
                          subtitle: Text(bottomMenuItems[index].subtitle),
                          onTap: () {
                            Navigator.pop(context);
                            debugPrint(bottomMenuItems[index].title);
                          },
                        );
                      }),
                ),

                //SizedBox(height: 10),

                Container(
                    height: 60, width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close,
                            size: 25, color: Colors.grey[900]))),
              ],
            ),
          );
        });
  }
}

class MenuModel {
  String title;
  String subtitle;
  IconData icon;

  MenuModel(this.title, this.subtitle, this.icon);
}
