import 'package:anime_world_app/api/api_anime.dart';
import 'package:anime_world_app/component/component_banner_anime.dart';
import 'package:anime_world_app/component/component_loader_card.dart';
import 'package:flutter/material.dart';

class WidgetBannerAnime extends StatelessWidget{
  const WidgetBannerAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () => getUpcomingAnime(filter: '', page: 1, limit: 10)), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const ComponentLoaderCard(panjang: 1);
        }

        if(snapshot.hasData){
          return ComponentBannerAnime(animes: snapshot.data!);
        }

        if(snapshot.hasError){
          print('Error : ${snapshot.stackTrace}');
        }
        return Text(snapshot.error.toString());
      }
    );
  }
}