import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/blocs/videos_bloc.dart';
import 'package:favoritos_youtube/delegates/data_search.dart';
import 'package:flutter/material.dart';
import 'package:favoritos_youtube/widgets/videotile.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            height: 25,
            child: Image.asset("images/imageyoutube.png"),
          ),
          elevation: 0,
          backgroundColor: Colors.black87,
          actions: <Widget>[
            IconButton(
              icon: Icon (Icons.search),
              onPressed: () async{
                String? result = await showSearch(context: context, delegate: DataSearch());
                if(result != null) BlocProvider.of<VideosBloc>(context).inSearch.add(result);
              },
            )
          ]
      ),
      body:StreamBuilder(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot){

          if(snapshot.hasData) {
            return ListView.builder(
                itemBuilder: (context, index){
                   return VideoTile(snapshot.data[index]);
                },
              itemCount: snapshot.data.length,
            );
          } else
            return Container();
        },
      ),
    ); //Scaffold
  }
}
