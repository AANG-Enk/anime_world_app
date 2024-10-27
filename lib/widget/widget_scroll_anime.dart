import 'package:anime_world_app/api/api_anime.dart';
import 'package:anime_world_app/component/component_scroll_anime.dart';
import 'package:flutter/material.dart';

class WidgetScrollAnime extends StatelessWidget{
  const WidgetScrollAnime({super.key, required this.link, required this.limit, required this.page});
  final String link;
  final int limit;
  final int page;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 6), () => getListAnime(link: link)), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const LinearProgressIndicator();
        }

        if(snapshot.hasData){
          print(snapshot.data);
        }

        if(snapshot.hasError){
          print('Error : ${snapshot.stackTrace}');
        }
        return Text(snapshot.error.toString());
      }
    );
  }
}