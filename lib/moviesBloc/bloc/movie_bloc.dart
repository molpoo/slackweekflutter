import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_test_slack_week/moviesBloc/bloc/repository/movie_repository.dart';
import 'package:flutter_test_slack_week/moviesBloc/model/Movie.dart';
import 'bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository _movieRepository;
  MovieBloc(this._movieRepository);

  @override
  MovieState get initialState => InitialMovieState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is GetMoviesEvent) {
      yield MovieLoading();

      final List<Movie> movies = await _movieRepository.getMovies();
      movies.sort((movie1, movie2) => movie1.name.compareTo(movie2.name));

      yield MovieLoaded(movies);
    }
  }
}
