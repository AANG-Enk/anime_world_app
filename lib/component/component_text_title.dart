import 'package:flutter/material.dart';

class ComponentTextTitle extends StatelessWidget{
  const ComponentTextTitle({super.key, required this.title, required this.link});
  final String title;
  final String link;

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
      Text(
        'Selengkapnya',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  );
  }
}