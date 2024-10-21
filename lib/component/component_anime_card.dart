import 'package:anime_world_app/model/anime.dart';
import 'package:anime_world_app/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class ComponentAnimeCard extends StatelessWidget{
  const ComponentAnimeCard({super.key,required this.animes, required this.title});
  final Iterable<Anime> animes;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430.0,
      child: ListView.separated(
        separatorBuilder: (context, index){
          return const SizedBox(width: 10.0,);
        }, 
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: animes.length,
        itemBuilder: (context, index){
          final anime = animes.elementAt(index);
          return GestureDetector(
            onTap: (){
              print("Ditekan Id : ${anime.id}");
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: FadeInImage.assetNetwork(
                      placeholder: '', 
                      image: anime.image.jpg.large_image,
                      fit: BoxFit.cover,
                      width: 150.0,
                      height: 250.0,
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
                            width: 150.0,
                            height: 250.0,
                            color: Colors.white,
                          )
                        );
                      },
                    )
                  ),
                ),
                const SizedBox(height: 5.0,),
                SizedBox(
                  width: 150.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        getNumberFormat(anime.members ?? 0),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0,),
                SizedBox(
                  width: 150.0,
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: getScore(anime.score!/2 ?? 0.0),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true, 
                        itemCount: 5, 
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemSize: 15.0,
                        unratedColor: Theme.of(context).primaryColor,
                        itemBuilder: (context, _){
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        }, 
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        '(${getScore(anime.score!/2 ?? 0.0)})',
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5.0,),
                SizedBox(
                  width: 150.0,
                  child: Text(
                    '${anime.type} (${anime.episodes} Eps)',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 5.0,),
                SizedBox(
                  width: 150.0,
                  child: Text(
                    '${getDateTime(anime.aired?.from)} - ${getDateTime(anime.aired?.to)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 5.0,),
                SizedBox(
                  width: 150.0,
                  child: Text(
                    anime.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );          
        }, 
      ),
    );
  }
}