import 'package:anime_world_app/widget/widget_anime_by_id.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{
  const DetailScreen({
    super.key,
    required this.mal_id,
  });

  final int mal_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
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
              const SizedBox(height: 20.0),
              WidgetAnimeById(id: mal_id),
            ],
          ),
        ),
      ),
    );
  }
}