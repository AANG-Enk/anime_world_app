class Thumbnail{
  final String? image;
  final String? small_image;
  final String? large_image;

  Thumbnail({
    this.image,
    this.small_image,
    this.large_image,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json){
    return Thumbnail(image: json['image'] ?? null, small_image: json['small_image'] ?? null , large_image: json['large_image'] ?? null);
  }

  Map<String, dynamic> toJson(){
    return {
      'image'       : image,
      'small_image' : small_image,
      'large_image' : large_image,
    };
  }
}