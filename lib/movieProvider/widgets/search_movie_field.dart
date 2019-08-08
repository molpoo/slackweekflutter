import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/movieProvider/providers/imdb_provider.dart';
import 'package:provider/provider.dart';

class SearchMovieField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final movieState = Provider.of<MovieState>(context);

    return Padding(
      padding: EdgeInsets.all(32),
      child: TextField(
        controller: TextEditingController(text: movieState.queryMovie),
        decoration: InputDecoration(
          labelText: "Movie name ?",
          border: OutlineInputBorder()
        ),
        onSubmitted: (movieQuery) => movieState.searchMovie(movieQuery),
      ),
    );
  }
}