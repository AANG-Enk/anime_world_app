import 'package:anime_world_app/config/app_theme.dart';
import 'package:anime_world_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: true,
      bottom: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime World App',
        theme: AppTheme.themeData,
        home: const HomeScreen(),
      ),
    );
  }
}