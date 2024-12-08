import 'package:flutter/material.dart';
import 'package:movie_app/screens/services/MovieServices.dart';
import 'package:movie_app/screens/widget/hrizontal_view_scroll.dart';

class MovieDetails extends StatefulWidget {
  final dynamic movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<dynamic> movies = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    MovieService movieService = MovieService();
    movies = await movieService.similarMovies(widget.movie['id']);
    print({'similar-movies': movies});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/${widget.movie['backdrop_path']}',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Title:${widget.movie['title']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Overview:${widget.movie['overview']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Release:${widget.movie['release_date']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating:${widget.movie['vote_average']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Vote Count:${widget.movie['vote_count']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Popularity:${widget.movie['popularity']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Similar Movies',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            HorizontalView(movies: movies)
          ],
        ),
      ),
    );
  }
}
