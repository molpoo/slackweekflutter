import 'dart:convert';
import 'package:flutter_test_slack_week/movies/model/Movie.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepository {

  /// Retrieve Movies from data sources
  Future<List<Movie>> getMovies();

}

class MovieRepositoryImpl implements MovieRepository {

  @override
  Future<List<Movie>> getMovies() async {
    final response = await http.get("https://www.omdbapi.com/?s=star+wars&apikey=81ad1731");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["Search"] as List;
      return rest.map<Movie>((json) => Movie.fromJson(json)).toList();
    } else {
      return <Movie>[];
    }
  }

}