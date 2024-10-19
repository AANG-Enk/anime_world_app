class Link{
  String linkListTopAnime(String type, String filter, int page, int limit){
    return 'https://api.jikan.moe/v4/top/anime?type=$type&filter=$filter&page=$page&limit=$limit';
  }

  String linkListAnime(int page, int limit, String type, String status, String order){
    return 'https://api.jikan.moe/v4/anime?page=$page&limit=$limit&type=$type&status=$status&order_by=$order';
  }

  String linkAnimeById(int id){
    return 'https://api.jikan.moe/v4/anime/$id/full';
  }

  String linkListAnimeSeason(int year, String season, String filter, int page, int limit){
    return 'https://api.jikan.moe/v4/seasons/$year/$season?filter=$filter&page=$page&limit=$limit';
  }

  String linkListAnimeSeasonNow(String filter, int page, int limit){
    return 'https://api.jikan.moe/v4/seasons/now?filter=$filter&page=$page&limit=$limit';
  }

  String linkListAnimeUpcoming(String filter, int page, int limit){
    return 'https://api.jikan.moe/v4/seasons/upcoming?filter=$filter&page=$page&limit=$limit';
  }

  String linkListSeason(){
    return 'https://api.jikan.moe/v4/seasons';
  }

  String linkListGenre(){
    return 'https://api.jikan.moe/v4/genres/anime';
  }
}