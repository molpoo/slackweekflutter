import 'package:flutter/cupertino.dart';
import 'package:flutter_test_slack_week/movieProvider/models/Movie.dart';
import 'package:flutter_test_slack_week/movieProvider/repository/movie_repository.dart';

class MovieState with ChangeNotifier {
  MovieState(this.repository);

  /// variables
  List<Movie> _movieFound = [];
  String _queryMovie = "";
  bool _isFetching = false;
  MovieRepository repository;

  /// getters
  List<Movie> get movieFound => _movieFound;
  String get queryMovie => _queryMovie;
  bool get isFetching => _isFetching;

  /// setter that notify listeners
  void setFetchingState(bool newValue) {
    _isFetching = newValue;
    notifyListeners();
  }

  void searchMovie(String queryMovie) async {
    setFetchingState(true);

    _queryMovie = queryMovie;
    _movieFound = await repository.getMovies(queryMovie);

    setFetchingState(false);
  }
}
