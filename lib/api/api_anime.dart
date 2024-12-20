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
    final data = json.decode(response.body);
    List<Anime> animes = List<Anime>.from(data['data'].map((x) => Anime.fromJson(x))).toList();
    return animes;
   }else{
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
   }
}

Future<Iterable<Anime>> getUpcomingAnime({
  required String filter,
  required int page,
  required int limit,
}) async {
  Link link = Link();
  final response = await http.get(Uri.parse(link.linkListAnimeUpcoming(filter, page, limit)));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<Anime> animes = List<Anime>.from(data['data'].map((x) => Anime.fromJson(x))).toList();
    return animes;
  }else{
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}

Future<Anime> getAnimeById({
  required int mal_id,
}) async {
  Link link = Link();
  final response = await http.get(Uri.parse(link.linkAnimeById(mal_id)));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    Anime animes = Anime.fromJson(data['data']);
    return animes;
  }else{
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}

Future<Iterable<Anime>> getListAnime({
  required String link,
}) async {
  final response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<Anime> animes = List<Anime>.from(data['data'].map((x) => Anime.fromJson(x))).toList();
    return animes;
  }else{
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}