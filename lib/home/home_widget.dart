import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/messages/messages_widget.dart';
import 'package:flutter_test_slack_week/movieProvider/providers/imdb_provider.dart';
import 'package:flutter_test_slack_week/movieProvider/repository/movie_repository.dart';
import 'package:flutter_test_slack_week/movieProvider/widgets/home_screen.dart';
import 'package:flutter_test_slack_week/moviesBloc/movie_list_widget.dart';
import 'package:flutter_test_slack_week/notification/notification.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MovieList(),
    MessageWidget(),
    NotificationWidget(),
    ChangeNotifierProvider(builder: (_) => MovieState(MovieRepositoryImpl()), child: HomeScreen())
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
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.movie),
            title: new Text('Movie Bloc'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.edit_attributes),
            title: new Text('Movie Provider'),
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
