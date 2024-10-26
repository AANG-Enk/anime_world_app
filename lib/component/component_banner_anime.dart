import 'package:anime_world_app/model/anime.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ComponentBannerAnime extends StatefulWidget{
  const ComponentBannerAnime({
    super.key,
    required this.animes,
  });
  final Iterable<Anime> animes;

  @override
  State<ComponentBannerAnime> createState() => _ComponentBannerAnime();
}

class _ComponentBannerAnime extends State<ComponentBannerAnime>{
  int _currentPageIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.animes.length, 
            itemBuilder: (context, index, realIndex){
              final anime = widget.animes.elementAt(index);
              return InkWell(
                splashColor: Theme.of(context).primaryColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: Image.network(
                      anime.image.jpg.large_image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }, 
            options: CarouselOptions(
              height: 300.0,
              enlargeFactor: 0.20,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              aspectRatio: 16 / 9,
              viewportFraction: 0.88,
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: _currentPageIndex,
            ),
          ),
          const SizedBox(height: 15),
          AnimatedSmoothIndicator(
            activeIndex: _currentPageIndex, 
            count: widget.animes.length,
            effect: ExpandingDotsEffect(
              dotHeight: 10.0,
              dotWidth: 8.0,
              activeDotColor: Theme.of(context).primaryColor,
              dotColor: Theme.of(context).shadowColor,
              expansionFactor: 3
            ),
          )
        ],
      ),
    );
  }
}