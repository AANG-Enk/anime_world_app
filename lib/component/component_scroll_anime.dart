import 'package:anime_world_app/api/api_anime.dart';
import 'package:anime_world_app/config/link.dart';
import 'package:anime_world_app/model/anime.dart';
import 'package:anime_world_app/screen/detail_screen.dart';
import 'package:anime_world_app/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class ComponentScrollAnime extends StatefulWidget{
  const ComponentScrollAnime({super.key, required this.filter, required this.type});
  final String filter;
  final String type;

  @override
  State<ComponentScrollAnime> createState() => _ComponentScrollAnime();
}

class _ComponentScrollAnime extends State<ComponentScrollAnime>{
  final ScrollController _scrollController = ScrollController();

  int page = 1;
  final int limit = 10;
  final List<Anime> items = [];
  bool isLoading = false;
  bool hasMore = true;
  final Link link = Link(); 

   @override
  void initState() {
    super.initState();
    _loadMoreItems();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMoreItems(); 
    }
  }

  Future<void> _loadMoreItems() async {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);
    Iterable<Anime> newAnimes = await getListAnime(link: link.linkListTopAnime(widget.type, widget.filter, page, limit));
    setState(() {
      items.addAll(newAnimes.map((data) => data).toList());
      page++;
      isLoading = false;
      if (newAnimes.length < limit) {
        hasMore = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 600 ? 2 : 8;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.37,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ), 
        itemCount: items.length,
        itemBuilder: (context, index){
          if(index == items.length){
            if(!isLoading) _loadMoreItems();
            return Center(child: CircularProgressIndicator(),);
          }
          return SizedBox(
            height: 400.0,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(mal_id: items.elementAt(index).id)));
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
                        image: items.elementAt(index).image.jpg.large_image,
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
                          getNumberFormat(items.elementAt(index).members ?? 0),
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
                          initialRating: getScore(items.elementAt(index).score!/2),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true, 
                          itemCount: 5, 
                          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                          itemSize: 15.0,
                          unratedColor: Theme.of(context).primaryColor,
                          itemBuilder: (context, _){
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          }, 
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                        Text(
                          '(${items.elementAt(index).score ?? 0.0})',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  SizedBox(
                    width: 150.0,
                    child: Text(
                      '${items.elementAt(index).type} (${items.elementAt(index).episodes} Eps)',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  SizedBox(
                    width: 150.0,
                    child: Text(
                      '${getDateTime(items.elementAt(index).aired?.from)} - ${getDateTime(items.elementAt(index).aired?.to)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  SizedBox(
                    width: 150.0,
                    child: Text(
                      items.elementAt(index).title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}