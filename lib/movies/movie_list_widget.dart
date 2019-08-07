import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_slack_week/movies/bloc/repository/movie_repository.dart';
import 'package:toast/toast.dart';
import './model/Movie.dart';
import 'bloc/movie_bloc.dart';
import 'bloc/movie_event.dart';
import 'bloc/movie_state.dart';
import 'movie_details_widget.dart';

class MovieList extends StatelessWidget {
  static const routeName = '/movielist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies list')),
      body: Center(
        child: MovieListElements(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Toast.show("Yo POM POM", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.TOP)
        },
      ),
    );
  }
}

class MovieListElements extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieListElementsState();
}

class _MovieListElementsState extends State<MovieListElements> {
  final movieBloc = MovieBloc(MovieRepositoryImpl());

  _MovieListElementsState() {
    movieBloc.dispatch(GetMoviesEvent());
  }

  Widget _buildMoviesList() {
    return BlocBuilder(
      bloc: movieBloc,
      builder: (BuildContext context, MovieState state) {
        if (state is InitialMovieState) {
          return _buildListOfMovies(<Movie>[]);
        } else if (state is MovieLoading) {
          return _buildLoading();
        } else if (state is MovieLoaded) {
          return _buildListOfMovies(state.movies);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildListOfMovies(List<Movie> movies) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(movies.length, (index) {
          return Scaffold(
              body: Center(
                  child: SizedBox(
                      child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: GestureDetector(
                              child: Hero(
                                  tag: "movie_cover" + movies[index].coverUrl,
                                  child: Image.network(movies[index].coverUrl)),
                              onTap: () => {
                                    Navigator.pushNamed(
                                        context,
                                        MovieDetails.routeName,
                                        arguments: movies[index])
                                  }),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 3))));
        }));
  }

  @override
  void dispose() {
    super.dispose();
    movieBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMoviesList();
  }
}
