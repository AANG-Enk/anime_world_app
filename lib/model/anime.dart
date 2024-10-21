import 'package:anime_world_app/model/genre.dart';
import 'package:anime_world_app/model/thumbnail_format.dart';
import 'package:anime_world_app/model/title.dart';

class Anime{
  final int id;
  final String title;
  final ThumbnailFormat image;
  final List<Title>? titles;
  final String? titleEnglish;
  final String? titleJapanese;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final Broadcast? broadcast;
  final List<Demographic>? producers;
  final List<Demographic>? licensors;
  final List<Demographic>? studios;
  final List<Genre>? genres;


  Anime({
    required this.id,
    required this.title,
    required this.image,
    this.titles,
    this.titleEnglish,
    this.titleJapanese,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    id: json['mal_id'], 
    title: json['title'], 
    image: ThumbnailFormat.fromJson(json['images']), 
    titles: json['titles'] != null ? List<Title>.from(json['titles'].map((x) => Title.fromJson(x))) : null, 
    titleEnglish: json['title_english'] ?? '', 
    titleJapanese: json['title_japanese'] ?? '', 
    type: json['type'] ?? '', 
    source: json['source'] ?? '', 
    episodes: json['episodes'] ?? 0, 
    status: json['status'] ?? '', 
    airing: json['airing'] ?? '', 
    aired: json['aired'] != null ? Aired.fromJson(json['aired']) : null, 
    duration: json['duration'] ?? '', 
    rating: json['rating'] ?? '', 
    score: json['score'] ?? 0.0, 
    scoredBy: json['scored_by'] ?? 0, 
    rank: json['rank'] ?? 0, 
    popularity: json['popularity'] ?? 0, 
    members: json['members'] ?? 0, 
    favorites: json['favorites'] ?? 0, 
    synopsis: json['synopsis'] ?? '', 
    background: json['background'] ?? '', 
    season: json['season'] ?? '', 
    year: json['year'] ?? 0, 
    broadcast: json['broadcast'] != null ? Broadcast.fromJson(json['broadcast']) : null,
    producers: json['producers'] != null ? List<Demographic>.from(json['producers'].map((a) => Demographic.fromJson(a))) : null, 
    licensors: json['licensors'] != null ? List<Demographic>.from(json['licensors'].map((y) => Demographic.fromJson(y))) : null, 
    studios: json['studios'] != null ? List<Demographic>.from(json['studios'].map((z) => Demographic.fromJson(z))) : null, 
    genres: json['genres'] != null ? List<Genre>.from(json['genres'].map((z) => Genre.fromJson(z))) : null, 
  );

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'title' : title,
      'image' : image?.toJson(),
      'titles' : titles,
      'titleEnglish' : titleEnglish,
      'titleJapanese' : titleJapanese,
      'type' : type,
      'source' : source,
      'episodes' : episodes,
      'status' : status,
      'airing' : airing,
      'aired' : aired,
      'duration' : duration,
      'rating' : rating,
      'score' : score,
      'scoredBy' : scoredBy,
      'rank' : rank,
      'popularity' : popularity,
      'members' : members,
      'favorites' : favorites,
      'synopsis' : synopsis,
      'background' : background,
      'season' : season,
      'year' : year,
      'broadcast' : broadcast,
      'producers' : producers,
      'licensors' : licensors,
      'studios' : studios,
      'genres' : genres,
    };
  }
}

class Aired {
    final DateTime? from;
    final DateTime? to;
    final Prop? prop;
    final String? string;

    Aired({
        this.from,
        this.to,
        this.prop,
        this.string,
    });

    factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"] != null ? DateTime.parse(json["from"]) : null,
        to: json["to"] != null ? DateTime.parse(json["to"]) : null,
        prop: json["prop"] != null ? Prop.fromJson(json["prop"]) : null,
        string: json["string"] ?? '',
    );
}

class Prop {
    final From? from;
    final From? to;

    Prop({
        this.from,
        this.to,
    });

    factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json["from"] != null ? From.fromJson(json["from"]) : null,
        to: json["to"] != null ? From.fromJson(json["to"]) : null,
    );

}

class From {
    final int? day;
    final int? month;
    final int? year;

    From({
        this.day,
        this.month,
        this.year,
    });

    factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"] ?? 0,
        month: json["month"] ?? 0,
        year: json["year"] ?? 0,
    );
}

class Broadcast {
    final String? day;
    final String? time;
    final String? timezone;
    final String? string;

    Broadcast({
        this.day,
        this.time,
        this.timezone,
        this.string,
    });

    factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"] ?? '',
        time: json["time"] ?? '',
        timezone: json["timezone"] ?? '',
        string: json["string"] ?? '',
    );

}

class Demographic {
    final int malId;
    final String type;
    final String name;
    final String url;

    Demographic({
        required this.malId,
        required this.type,
        required this.name,
        required this.url,
    });

    factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
    );

}