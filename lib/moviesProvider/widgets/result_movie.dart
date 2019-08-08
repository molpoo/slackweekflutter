import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_slack_week/moviesProvider/providers/imdb_provider.dart';
import 'package:provider/provider.dart';

class ResultMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imdbProvider = Provider.of<MovieState>(context);

    return Container(
        child: imdbProvider.isFetching
            ? CircularProgressIndicator()
            : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: imdbProvider.movieFound.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  imdbProvider.movieFound[index].coverUrl)),
                          title: Text(imdbProvider.movieFound[index].name));
                    }));
  }
}
