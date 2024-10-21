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
    return Thumbnail(
      image: json['image_url'] ?? '' , 
      small_image: json['small_image_url'] ?? '' , 
      large_image: json['large_image_url'] ?? ''
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'image'       : image,
      'small_image' : small_image,
      'large_image' : large_image,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Thumbnail (image: $image, small_image: $small_image, large_image: $large_image)';
  }
}