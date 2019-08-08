import 'package:flutter/material.dart';
import './model/Movie.dart';

class MovieDetails extends StatelessWidget {
  static const routeName = '/movie_details';

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Retour"),
      ),
      body:
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(movie.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("year: "+movie.year, style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic))
              ),
              Center(
                child:  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Hero(
                      tag: "movie_cover"+movie.coverUrl,
                      child: Image.network(movie.coverUrl),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 3
                ),
              )],
          ),
        )
    );
  }
}

class MovieDetailsArguments {
  final Movie movie;

  MovieDetailsArguments(this.movie);
}