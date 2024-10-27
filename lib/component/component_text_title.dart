import 'package:anime_world_app/screen/more_screen.dart';
import 'package:flutter/material.dart';

class ComponentTextTitle extends StatelessWidget{
  const ComponentTextTitle({super.key, required this.title, required this.filter, required this.type});
  final String title;
  final String filter;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => MoreScreen(title: title, filter: filter, type: type)));
            },
            style: const ButtonStyle(
              overlayColor: WidgetStateColor.transparent,
            ),
            child: Text(
              'Selengkapnya',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}