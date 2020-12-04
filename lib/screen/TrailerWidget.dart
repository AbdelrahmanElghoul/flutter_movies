import 'package:flutter/material.dart';
import 'package:flutter_movies/Trailer.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
class TrailerWidget extends StatelessWidget {
  Trailer trailer;
  TrailerWidget({@required this.trailer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        urlLauncher.launch('https://www.youtube.com/watch?v=${trailer.key}');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.black54,
                  size: 35,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${trailer.type}',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:5),
                      child: Text(
                        '${trailer.name}',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
