import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_details.dart';

class HorizontalView extends StatelessWidget {
  final List<dynamic> movies;
  const HorizontalView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    print({"movie_data": movies});
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(movies.length, (index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie)));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Text(movie['title']),
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
