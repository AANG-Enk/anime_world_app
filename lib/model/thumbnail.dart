class Thumbnail{
  final String image;
  final String small_image;
  final String large_image;

  Thumbnail({
    required this.image,
    required this.small_image,
    required this.large_image,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json){
    return Thumbnail(image: json['image'], small_image: json['small_image'], large_image: json['large_image']);
  }
}