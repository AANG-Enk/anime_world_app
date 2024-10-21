import 'package:anime_world_app/model/thumbnail.dart';

class ThumbnailFormat{
  final Thumbnail jpg;
  final Thumbnail webp;

  ThumbnailFormat({
    required this.jpg,
    required this.webp,
  });

  factory ThumbnailFormat.fromJson(Map<String, dynamic> json){
    return ThumbnailFormat(
      jpg: Thumbnail.fromJson(json['jpg']), 
      webp: Thumbnail.fromJson(json['webp']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'jpg' : jpg.toJson(),
      'webp': webp.toJson(),
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Thumbnail Format (jpg: $jpg,webp: $webp)';
  }
}