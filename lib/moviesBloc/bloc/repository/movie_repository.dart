import 'dart:convert';
import 'package:flutter_test_slack_week/moviesBloc/model/Movie.dart';
import 'package:flutter_test_slack_week/network/LogginInterceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

abstract class MovieRepository {

  /// Retrieve Movies from data sources
  Future<List<Movie>> getMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  Client client = HttpClientWithInterceptor.build(interceptors: [
    LogginInterceptor(),
  ]);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await client.get("https://www.omdbapi.com/?s=star+wars&apikey=81ad1731");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["Search"] as List;
      return rest.map<Movie>((json) => Movie.fromJson(json)).toList();
    } else {
      return <Movie>[];
    }
  }

}