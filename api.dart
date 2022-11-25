import 'package:favoritos_youtube/models/videos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const API_KEY = "AIzaSyCu7IKuy3DKHw4_JmzMmRnOa-U2ks5SI-c";
class Api{
  search(String search) async{
    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10")
    );
    return decode(response);

    }
    decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);
      List<Video> videos = decoded["items"].map<Video>(
              (map){
                return Video.fromJson(map);

              }
      ).toList();
    }else {
      throw Exception("Failed to load videos");
    }
    }
  }
