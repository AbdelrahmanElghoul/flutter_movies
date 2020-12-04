import 'package:flutter/material.dart';
import 'package:flutter_movies/screen/MovieDetailsScreen.dart';
import 'package:flutter_movies/util/Const.dart';

import '../Movie.dart';

class MovieListWidget extends StatelessWidget {

  Widget imageFun() {
    if (movie.posterURL == null)
      return Icon(
        Icons.broken_image,
        size: POSTER_DEFAULT_HEIGHT,
      );
    else
      return Image.network(
        '${PosterBaseURL}${movie.posterURL}',
        height: POSTER_DEFAULT_HEIGHT,
        fit: BoxFit.fill,
      );
  }
  final Movie movie;
  MovieListWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('MovieListWidget mDebug: ${movie.title}');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>
            MovieDetailsScreen(movie: movie,)
        ));

      },
      child: Card(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        child: Container(
          color: Colors.white,
          // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              imageFun(),
              Expanded(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      '${movie.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
