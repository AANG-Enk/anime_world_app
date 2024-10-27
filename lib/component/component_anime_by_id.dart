import 'package:anime_world_app/model/anime.dart';
import 'package:anime_world_app/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComponentAnimeById extends StatelessWidget{
  const ComponentAnimeById({super.key, required this.anime});
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: FadeInImage.assetNetwork(
                placeholder: '', 
                image: anime.image.jpg.large_image,
                fit: BoxFit.cover,
                width: 175.0,
                height: 300.0,
                imageErrorBuilder: (context, error, stackTrace){
                  return const Center(child: Text('Failed Load Image'),);
                },
                fadeInDuration: const Duration(milliseconds: 5000),
                fadeInCurve: Curves.easeInOut,
                placeholderErrorBuilder: (context, error, stackTrace){
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!, 
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 175.0,
                      height: 300.0,
                      color: Colors.white,
                    )
                  );
                },
              )
            ),
            const SizedBox(width: 20.0,),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      anime.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  _textUpperAnime(context, 'Ranked : ${anime.rank}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Members : ${getNumberFormat(anime.members ?? 0)}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Popularity : ${anime.popularity}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Score : ${anime.score}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Season : ${anime.season}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Year : ${anime.year}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Type : ${anime.type}'),
                  const SizedBox(height: 10.0,),
                  _textUpperAnime(context, 'Studio : ${anime.studios?.first.name}'),
                  const SizedBox(height: 10.0,),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0,),
        Text(
          anime.synopsis!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 15.0,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3.0
              )
            )
          ),
          child: Text('Alternative Titles',style: Theme.of(context).textTheme.bodyLarge,),
        ),
        const SizedBox(height: 15.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textUpperAnime(context, 'English : ${anime.titleEnglish}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Japan : ${anime.titleJapanese}'),
          ],
        ),
        const SizedBox(height: 15.0,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3.0
              )
            )
          ),
          child: Text('Information',style: Theme.of(context).textTheme.bodyLarge,),
        ),
        const SizedBox(height: 15.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textUpperAnime(context, 'Episode : ${anime.episodes}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Status : ${anime.status}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Aired : ${getDateTime(anime.aired?.from)} to ${getDateTime(anime.aired?.to)}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Sources : ${anime.source}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Producers : ${anime.producers?.map((x) => x.name ).join(', ')}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Genres : ${anime.genres?.map((x) => x.name ).join(', ')}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Duration : ${anime.duration}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Rating : ${anime.rating}'),
            const SizedBox(height: 10.0,),
            _textUpperAnime(context, 'Licensors : ${anime.licensors?.map((x) => x.name).join(', ')}'),
            const SizedBox(height: 10.0,),
          ],
        ),
      ],
    );
  }
}

Widget _textUpperAnime(context, text){
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}