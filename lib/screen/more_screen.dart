import 'package:anime_world_app/component/component_scroll_anime.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget{
  const MoreScreen({
    super.key,
    required this.link,
  });

  final String link;

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
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: Icon(
                      Icons.arrow_back, 
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      'Back', 
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),  
                  ),
                ),
                const SizedBox(height: 20.0),
                const ComponentScrollAnime(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}