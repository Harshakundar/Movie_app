import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieSlider extends StatelessWidget {
  final List<dynamic> topratedMovies;
  const MovieSlider({super.key, required this.topratedMovies});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: topratedMovies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = topratedMovies[index];
        return GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie['backdrop_path']}',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
          height: 250,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enableInfiniteScroll: true,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8),
    );
  }
}
