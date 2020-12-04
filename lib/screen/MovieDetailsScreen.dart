import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movies/Movie.dart';
import 'package:flutter_movies/util/Const.dart';

import 'TrailersScreen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final double textSize = 18;
  final int imageHeightPercent = 4;
  final Movie movie;
  MovieDetailsScreen({@required this.movie});
  @override
  Widget build(BuildContext context) {
    print('MovieDetailsScreen mDebug: ${movie.id}');
    print('MovieDetailsScreen mDebug: ${movie.adults}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar_color,
        title: Text('${movie.title}'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: background_color,
        padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              // margin: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // textBaseline: TextBaseline.ideographic ,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        '$PosterBaseURL${movie.posterURL}',
                        height: MediaQuery.of(context).size.height /
                            imageHeightPercent,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                        height: MediaQuery.of(context).size.height /
                            imageHeightPercent,
                        // color: Colors.yellow,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${movie.originalTitle}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: textSize,
                              ),
                            ),
                            Text(
                              '${movie.language}',
                              style: TextStyle(fontSize: textSize),
                            ),
                            Text(
                              '${movie.rate}',
                              style: TextStyle(fontSize: textSize),
                            ),
                            Text(
                              '${movie.date}',
                              style: TextStyle(fontSize: textSize),
                            ),
                            Text(
                              '${movie.adults ? 'adults only ' : 'family friendly'}',
                              style: TextStyle(fontSize: textSize),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text('${movie.overview}',
                      style: TextStyle(
                      fontSize: textSize,
                    ),),
                  ),
                )

            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 10),
              child: FlatButton(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                color: button_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: (){
                  print('$MovieDetailsScreen mDebug: reviews');
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) =>
                  //     MovieDetailsScreen(movie: movie,)
                  // ));
                },
                child: Text('reviews',style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize
                ),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 10),
              child: FlatButton(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                color: button_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: (){
                  print('${MovieDetailsScreen} mDebug:trailers');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) =>
                      TrailersScreen(movieId: movie.id,)
                  ));
                },
                child: Text('trailers',style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize
                ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
