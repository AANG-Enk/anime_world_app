import 'package:anime_world_app/model/genre.dart';
import 'package:anime_world_app/model/thumbnail.dart';
import 'package:anime_world_app/model/title.dart';

class Anime{
  final int id;
  final String title;
  final Map<String, Thumbnail>? image;
  final Map<String, Title>? titles;
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
  final Map<String, Demographic>? producers;
  final Map<String, Demographic>? licensors;
  final Map<String, Demographic>? studios;
  final Map<String, Genre>? genres;
  final List<dynamic>? explicitGenres;
  final List<dynamic>? themes;
  final Map<String, Demographic>? demographics;


  Anime({
    required this.id,
    required this.title,
    required this.image,
    required this.titles,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    id: json['mal_id'], 
    title: json['title'], 
    image: json['images'] != null ? Map.from(json['images']).map((k,v) => MapEntry<String, Thumbnail>(k, Thumbnail.fromJson(v))) : null, 
    titles: json['titles'] != null ? Map.from(json['titles']).map((k,v) => MapEntry<String, Title>(k, Title.fromJson(v))) : null, 
    titleEnglish: json['title_english'] ?? '', 
    titleJapanese: json['title_japanese'] ?? '', 
    type: json['type'] ?? '', 
    source: json['source'] ?? '', 
    episodes: json['episodes'] ?? '', 
    status: json['status'] ?? '', 
    airing: json['airing'] ?? '', 
    aired: json['aired'] != null ? Aired.fromJson(json['aired']) : null, 
    duration: json['duration'] ?? '', 
    rating: json['rating'] ?? '', 
    score: json['score'] ?? '', 
    scoredBy: json['scored_by'] ?? '', 
    rank: json['rank'] ?? '', 
    popularity: json['popularity'] ?? '', 
    members: json['members'] ?? '', 
    favorites: json['favorites'] ?? '', 
    synopsis: json['synopsis'] ?? '', 
    background: json['background'] ?? '', 
    season: json['season'] ?? '', 
    year: json['year'] ?? '', 
    broadcast: json['broadcast'] != null ? Broadcast.fromJson(json['broadcast']) : null,
    producers: json['producers'] != null ? Map.from(json['producers']).map((k,v) => MapEntry<String, Demographic>(k, Demographic.fromJson(v))) : null, 
    licensors: json['licensors'] != null ? Map.from(json['licensors']).map((k,v) => MapEntry<String, Demographic>(k, Demographic.fromJson(v))) : null, 
    studios: json['studios'] != null ? Map.from(json['studios']).map((k,v) => MapEntry<String, Demographic>(k, Demographic.fromJson(v))) : null, 
    genres: json['genres'] != null ? Map.from(json['genres']).map((k,v) => MapEntry<String, Genre>(k, Genre.fromJson(v))) : null, 
    explicitGenres: json['explicit_genres'] != null ? List<dynamic>.from(json['explicit_genres'].map((eg) => eg)) : null, 
    themes: List<dynamic>.from(json["themes"].map((x) => x)), 
    demographics: json['demographics'] != null ? Map.from(json['demographics']).map((k,v) => MapEntry<String, Demographic>(k, Demographic.fromJson(v))) : null,
  );
}

class Aired {
    final DateTime? from;
    final DateTime? to;
    final Prop? prop;
    final String? string;

    Aired({
        required this.from,
        required this.to,
        required this.prop,
        required this.string,
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
        required this.from,
        required this.to,
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
        required this.day,
        required this.month,
        required this.year,
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
        required this.day,
        required this.time,
        required this.timezone,
        required this.string,
    });

    factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"] ?? '',
        time: json["time"] ?? '',
        timezone: json["timezone"] ?? '',
        string: json["string"] ?? '',
    );

}

class Demographic {
    final int? malId;
    final Type? type;
    final String? name;
    final String? url;

    Demographic({
        required this.malId,
        required this.type,
        required this.name,
        required this.url,
    });

    factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"] ?? '',
        type: json["type"] != null ? typeValues.map[json["type"]]! : null,
        name: json["name"] ?? '',
        url: json["url"] ?? '',
    );

}

enum Type {
    ANIME
}

final typeValues = EnumValues({
    "anime": Type.ANIME
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}