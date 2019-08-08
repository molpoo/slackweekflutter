import 'package:equatable/equatable.dart';
import 'package:flutter_test_slack_week/moviesBloc/model/Movie.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieState extends Equatable {
  MovieState([List props = const []]) : super(props);
}

class InitialMovieState extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded(this.movies) : super([movies]);
}