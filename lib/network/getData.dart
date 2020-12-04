import 'dart:convert';

import 'package:flutter_movies/Movie.dart';
import 'package:flutter_movies/Trailer.dart';
import 'package:flutter_movies/util/Const.dart';
import 'package:flutter_movies/util/MovieType.dart';
import 'package:http/http.dart' as http;

class GetData{

 static int _page;
 static String _type;

  Future nextPage() async{
    _page++;
    print('mDebug: next page type=${_type} page=$_page');
    print('page=$_page');
    return await getMovieList(_type);
  }

  Future getMovieList(String type) async{
    if(type!=_type) _page=1;
    _type=type;
    String url='${Base_URL}$type/?api_key=$API_KEY&language=$Lang&page=$_page';
    http.Response response = await http.get(url);

    var data=jsonDecode(response.body)['results'] as List;
    // print('getData mDebug: ${data}');

    List<Movie> movieList=List<Movie>();
    data.forEach((element) {
      // print('mDebug: testing: $element');
      movieList.add(Movie.fromJson(element));
    });

    // print("debug1:${movieList[0].name}");
    return movieList;

  }

  Future getTrailers(String id) async{
    String url='$Base_URL$id/videos?api_key=$API_KEY&language=$Lang';
    http.Response response = await http.get(url);

    var data=jsonDecode(response.body)['results'] as List;
    print('getData mDebug: data count=${data.length}');

    List<Trailer> trailerList=[];
    data.forEach((element) {
      // print('getData mDebug: pre data=$element');
      trailerList.add(Trailer.fromJson(element));
      // print('getData mDebug: post data=$element');
    });

    print("getData mDebug: trailer list=${trailerList.length}");
    return trailerList;
  }

}