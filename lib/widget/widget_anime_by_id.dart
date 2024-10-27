import 'package:anime_world_app/api/api_anime.dart';
import 'package:anime_world_app/component/component_anime_by_id.dart';
import 'package:anime_world_app/component/component_banner_anime.dart';
import 'package:anime_world_app/component/component_loader_card.dart';
import 'package:anime_world_app/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class WidgetAnimeById extends StatelessWidget{
  const WidgetAnimeById({super.key,required this.id});
  final int id;
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () => getAnimeById(mal_id: id)), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const LinearProgressIndicator();
        }

        if(snapshot.hasData){
          return ComponentAnimeById(anime: snapshot.data!);
        }

        if(snapshot.hasError){
          print('Error : ${snapshot.stackTrace}');
        }
        return Text(snapshot.error.toString());
      }
    );
  }
}