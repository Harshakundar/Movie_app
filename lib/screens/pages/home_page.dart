import 'package:flutter/material.dart';
import 'package:movie_app/screens/services/MovieServices.dart';
import 'package:movie_app/screens/widget/filtered_movie_list.dart';
import 'package:movie_app/screens/widget/hrizontal_view_scroll.dart';
import 'package:movie_app/screens/widget/movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> popularMovies = [];
  List<dynamic> topRateMovies = [];
  List<dynamic> upcomingMovies = [];
  List<dynamic> filteredMovies = [];
  bool _isSearchEmpty = true;
  bool _isLoading = true;

  void filtereMovies(String query) {
    setState(() {
      filteredMovies = popularMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          upcomingMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          topRateMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList();
      if (query.isEmpty) {
        _isSearchEmpty = true;
      } else {
        _isSearchEmpty = false;
      }
    });
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3))
      ]),
      padding: const EdgeInsets.all(4),
      child: TextField(
        onChanged: (value) {
          filtereMovies(value);
        },
        decoration: const InputDecoration(
            hintText: 'Search Movies',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  @override
  void initState() {
    fethMovies();
    super.initState();
  }

  fethMovies() async {
    MovieService movieServices = MovieService();
    popularMovies = await movieServices.populaMovies();
    topRateMovies = await movieServices.topRated();
    upcomingMovies = await movieServices.upComingMovies();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          searchBar(),
          _isLoading
              ? const CircularProgressIndicator()
              : _isSearchEmpty == false
                  ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Filterd Movies',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        FilteredMovieList(movies: filteredMovies)
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Top Rated Movies',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        MovieSlider(topratedMovies: topRateMovies),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Upcoming Movies',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        HorizontalView(movies: upcomingMovies),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Popular Movies',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        HorizontalView(movies: popularMovies),
                      ],
                    )
        ],
      ),
    );
  }
}
