import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieEvent extends Equatable {
  MovieEvent([List props = const []]) : super(props);
}

class GetMoviesEvent extends MovieEvent {
  GetMoviesEvent() : super();
}
