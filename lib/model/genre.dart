class Genre{
  final int id;
  final String name;
  final String url;
  final int count;

  Genre({
    required this.id,
    required this.name,
    required this.url,
    required this.count,
  });

  factory Genre.fromJson(Map<String, dynamic> json){
    return Genre(id: json['mal_id'], name: json['name'], url: json['url'], count: json['count']);
  }
}