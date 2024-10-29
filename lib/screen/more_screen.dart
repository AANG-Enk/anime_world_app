import 'package:anime_world_app/component/component_scroll_anime.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget{
  const MoreScreen({
    super.key,
    required this.filter,
    required this.type,
    required this.title,
  });

  final String filter;
  final String type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          icon: Icon(
                            Icons.arrow_back, 
                            color: Theme.of(context).primaryColor,
                          ),
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(Colors.transparent),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
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
                                    height: 200.0,
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
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ComponentScrollAnime(filter: filter, type: type),
              ],
            ),
          ),
        ),
      ),
    );
  }
}