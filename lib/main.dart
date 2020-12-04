import 'package:flutter/material.dart';
import 'package:flutter_movies/Movie.dart';
import 'package:flutter_movies/network/getData.dart';
import 'package:flutter_movies/screen/HomeScreen.dart';
import 'package:flutter_movies/util/Const.dart';
import 'package:flutter_movies/util/MovieType.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movie> dataList;

  getData({String type = MovieType.top_rated}) async {
    dataList=null;
    var list = await GetData().getMovieList(type);
    setState(() {
      dataList = list;
    });
  }

  @override
  int initState(){
    super.initState();
    getData();
  }

  Widget main() {
    if (dataList== null) {
      return SpinKitDoubleBounce(
        color: notificaiton_color,
        size: 100,
      );
    }
    return HomeScreen(dataList);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: appbar_color,
          actions: [
            PopupMenuButton<String>(
              onSelected: (selected) {
                // print('mDebug: menu selected=$selected');
                setState(() {
                  getData(type: selected.replaceFirst(' ', '_'));
                });
              },
              itemBuilder: (BuildContext context) {
                return MovieType.getList().map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          title: Text('Movies'),
        ),
        body: main(),
      ),
    );
  }
}
