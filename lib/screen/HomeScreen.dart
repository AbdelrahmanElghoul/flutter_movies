import 'package:flutter/material.dart';
import 'package:flutter_movies/Movie.dart';
import 'package:flutter_movies/network/getData.dart';
import 'package:flutter_movies/util/Const.dart';

import 'MovieListWidget.dart';

class HomeScreen extends StatefulWidget {

  List<Movie> movieList;
  HomeScreen(this.movieList);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController  _scrollController;

  getData() async {
    var list= await GetData().nextPage();
    setState(() {
      widget.movieList.addAll(list);
    });
  }

  List<MovieListWidget> getMoviesWidget(){
    List<MovieListWidget> widgetList=List();
    widget.movieList.forEach((element) {
      // print("name:${element.name}");
      // print("url:${element.posterURL}");
      widgetList.add(MovieListWidget(movie:element));
    });

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    _scrollController=ScrollController()..addListener(() {
      print('mDebug: scroll offset = ${_scrollController.offset.roundToDouble()}');
      print('mDebug: scroll max = ${(_scrollController.position.maxScrollExtent.roundToDouble())}');

      if(_scrollController.offset.roundToDouble()==
          (_scrollController.position.maxScrollExtent.roundToDouble())){
        getData();
      }

    });
    // double cardWidth = MediaQuery.of(context).size.width / 3;
    // double cardHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
        backgroundColor:background_color,
        body: Padding(
          padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
          child: GridView.count(
            controller: _scrollController,
            mainAxisSpacing: 5, // area between rows
            childAspectRatio:  0.65, // child height
            crossAxisCount: 3, // itemCount
            children: getMoviesWidget(),
          ),
        ),
    );
  }
}

