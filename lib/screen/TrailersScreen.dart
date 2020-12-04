import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/network/getData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_movies/util/Const.dart';

import 'TrailerWidget.dart';

class TrailersScreen extends StatefulWidget {

  String movieId;
  TrailersScreen({@required this.movieId});

  @override
  _TrailersScreenState createState() => _TrailersScreenState();
}

class _TrailersScreenState extends State<TrailersScreen> {
  List trailerList;
  List<TrailerWidget> trailerWidgetList=[];


  getData() async{
    trailerList= await GetData().getTrailers(widget.movieId);
    print('mDebug: xxx 1 ${trailerList.length}');
    if(trailerList.length==0) {
      Navigator.pop(context);
    }
    setState(() {
      trailerList.forEach((element) {
        print('TrailersScreen mDebug: $element');
        trailerWidgetList.add(TrailerWidget(trailer:element));
      });
    });
  }


  Widget loadTrailers(){
    if(trailerWidgetList.length==0) {
      getData();
       return SpinKitDoubleBounce(
        color: notificaiton_color,
        size: 100,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top:5.0),
      child: ListView(
        children: trailerWidgetList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(title: Text('Trailers'),backgroundColor: appbar_color,),
      body: loadTrailers(),
    );
  }
}
