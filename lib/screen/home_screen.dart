import 'package:anime_world_app/component/component_text_title.dart';
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
                    icon: Icon(Icons.info),
                    color: Theme.of(context).primaryColor,
                    iconSize: 25.0,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Information'),
                            content: Text('This is information icon.'),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }, 
                                child: Text('Ok')
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
              const Column(
                children: [
                  ComponentTextTitle(title: 'Top Ranked Anime', link: ''),
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