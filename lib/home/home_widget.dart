import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/bluetooth/bluetooth_screen.dart';
import 'package:flutter_test_slack_week/bluetooth/providers/bluetooth_state.dart';
import 'package:flutter_test_slack_week/messages/messages_widget.dart';
import 'package:flutter_test_slack_week/moviesProvider/providers/imdb_provider.dart';
import 'package:flutter_test_slack_week/moviesProvider/repository/movie_repository.dart';
import 'package:flutter_test_slack_week/moviesProvider/widgets/home_screen.dart';
import 'package:flutter_test_slack_week/moviesBloc/movie_list_widget.dart';
import 'package:flutter_test_slack_week/notification/notification.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MovieList(),
    ChangeNotifierProvider(
        builder: (_) => MovieState(MovieRepositoryImpl()), child: HomeScreen()),
    MessageWidget(),
    NotificationWidget(),
    ChangeNotifierProvider(
      builder: (_) => BluetoothStateProvider(), child: BluetoothScreen(),
    ),
    Scaffold(
      appBar: AppBar(
        title: Text("Webview"),
      ),
      body: WebView(
        initialUrl: "http://www.google.fr",
      ),
    )
  ];
  GlobalKey<FormState> _homeKey =
      GlobalKey<FormState>(debugLabel: '_homeScreenkey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children[_currentIndex],
        key: _homeKey,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('Movie Bloc'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_attributes),
            title: Text('Movie Provider'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth), title: Text('Bluetooth')),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            title: Text("Web")
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
