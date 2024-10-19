import 'package:anime_world_app/config/link.dart';
import 'package:anime_world_app/model/anime.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Anime>> getTopAnime({
  required String type,
  required String filter,
  required int page,
  required int limit,
}) async {
  Link link = Link();
  final response = await http.get(Uri.parse(link.linkListTopAnime(type, filter, page, limit)));
   if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> animeList = data['data'];
    return animeList.map((animeJson) => Anime.fromJson(animeJson));
   }else{
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
   }
}