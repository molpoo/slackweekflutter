import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/moviesProvider/widgets/result_movie.dart';
import 'package:flutter_test_slack_week/moviesProvider/widgets/search_movie_field.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies with Provider"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Scaffold(
          body: Column(
            children: <Widget>[SearchMovieField(), ResultMovie()],
          ),
        ));
  }
}
