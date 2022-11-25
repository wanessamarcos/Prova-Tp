import 'package:favoritos_youtube/models/videos.dart';
import 'package:flutter/material.dart';
import 'dart:core';
class VideoTile extends StatelessWidget {
 final Video video;
 VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.symmetric(vertical:4 ),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       AspectRatio(
           aspectRatio: 16.0/9.0,
           child: Image.network(video.thumb,fit: BoxFit.cover,)
       ),
       Row()
      ],
     ),
    );
  }
}
