import 'package:anime_world_app/component/component_text_title.dart';
import 'package:anime_world_app/config/link.dart';
import 'package:anime_world_app/widget/widget_banner_anime.dart';
import 'package:anime_world_app/widget/widget_favorit_anime.dart';
import 'package:anime_world_app/widget/widget_popular_anime.dart';
import 'package:anime_world_app/widget/widget_top_anime.dart';
import 'package:anime_world_app/widget/widget_top_movie.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    TextStyle headlineApp = Theme.of(context).textTheme.headlineMedium!;
    Link link = Link();
    return Scaffold(
      body: SingleChildScrollView(
        child : Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Anime World',
                    style: headlineApp,
                  ),
                  IconButton(
                    icon: const Icon(Icons.info),
                    color: Theme.of(context).primaryColor,
                    iconSize: 25.0,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            backgroundColor: Theme.of(context).shadowColor,
                            title: Center(
                              child: Text(
                              'Anime World App',
                                style: Theme.of(context).textTheme.headlineMedium
                              ),
                            ),
                            content:SizedBox(
                              height: 120.0,
                              child:  Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'This application offers a variety of features, such as searching for anime by genre, popularity, or latest releases, as well as the ability to mark favorite anime.',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                  const SizedBox(height: 15.0,),
                                  Center(
                                    child: Text(
                                      'v. 1.0.0 Beta version',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                                ), 
                                child: Center(
                                  child: Text(
                                    'Oke',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                      );
                    }, 
                  )
                ],
              ),
              const SizedBox(height: 10.0,),
              Column(
                children: [
                  WidgetBannerAnime(),
                  SizedBox(height: 25.0,),
                  ComponentTextTitle(title: 'Top Ranked Anime', link: link.linkListTopAnime('tv', '', 2, 10)),
                  SizedBox(height: 15.0,),
                  WidgetTopAnime(),
                  SizedBox(height: 25.0,),
                  ComponentTextTitle(title: 'Favorites Anime', link: ''),
                  SizedBox(height: 15.0,),
                  WidgetFavoritAnime(),
                  SizedBox(height: 25.0,),
                  ComponentTextTitle(title: 'Most Popular Anime', link: ''),
                  SizedBox(height: 15.0,),
                  WidgetPopularAnime(),
                  SizedBox(height: 25.0,),
                  ComponentTextTitle(title: 'Top Ranked Movie', link: ''),
                  SizedBox(height: 15.0,),
                  WidgetTopMovie(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}