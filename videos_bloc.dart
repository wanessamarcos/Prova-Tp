import 'dart:core';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/api.dart';
import 'dart:async';
import 'package:favoritos_youtube/models/videos.dart';
class VideosBloc implements BlocBase {
   late Api api;
  late List<Video> videos;

  final StreamController<List<Video>> _videosController = StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;
  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;
  VideosBloc(){
    api = Api();
    _searchController.stream.listen(_search);
  }
  void _search(search)async {
     videos = await api.search(search);
     _videosController.sink.add(videos);
  }
  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

}