import 'package:anime_world_app/api/api_anime.dart';
import 'package:anime_world_app/component/component_anime_card.dart';
import 'package:anime_world_app/component/component_loader_card.dart';
import 'package:flutter/material.dart';

class WidgetFavoritAnime extends StatelessWidget{
  const WidgetFavoritAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4), () => getTopAnime(type: 'tv', filter: 'favorite', page: 1, limit: 10)), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const ComponentLoaderCard(panjang: 10);
        }

        if(snapshot.hasData){
          return ComponentAnimeCard(animes: snapshot.data!, title: 'Top Ranked Anime',);
        }

        if(snapshot.hasError){
          print('Error : ${snapshot.stackTrace}');
        }
        return Text(snapshot.error.toString());
      }
    );
  }
}