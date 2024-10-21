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
    return Genre(
      id: json['mal_id'] != null ? json['mal_id'] : 0 , 
      name: json['name'] != null ? json['name'] : '', 
      url: json['url'] != null ? json['url'] : '', 
      count: json['count'] != null ? json['count'] : 0
    );
  }
}