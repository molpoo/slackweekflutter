import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String name;
  final String coverUrl;
  final String year;

  Movie({this.name, this.coverUrl, this.year}) : super([name, coverUrl]);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        name: json['Title'],
        coverUrl: json['Poster'],
        year: json['Year']
    );
  }
}