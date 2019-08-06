import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/messages/messages_widget.dart';
import 'package:flutter_test_slack_week/movies/movie_list_widget.dart';
import 'package:flutter_test_slack_week/notification/notification.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MovieList(),
    Messages("salut la mif"),
    NotificationWidget("Una notificazione")
  ];
  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children[_currentIndex],
        key: _homeKey,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.movie),
            title: new Text('Movie'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
