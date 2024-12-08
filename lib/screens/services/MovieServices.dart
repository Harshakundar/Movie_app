import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieService {
  Future<List<dynamic>> populaMovies() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTJhNWU2YjAxYzAyZTI2NDRhNTE5ZWM5MWQ2ZDY4OSIsIm5iZiI6MTczMjExNzc2NC40OTIsInN1YiI6IjY3M2UwNTA0YWIyZTI1MGY1NzBmN2I5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MEtgXEXHYKDYxvhkD0ChSzviTKB1AnZcKB5mn5zS8jE',
      'Accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> topRated() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTJhNWU2YjAxYzAyZTI2NDRhNTE5ZWM5MWQ2ZDY4OSIsIm5iZiI6MTczMjExNzc2NC40OTIsInN1YiI6IjY3M2UwNTA0YWIyZTI1MGY1NzBmN2I5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MEtgXEXHYKDYxvhkD0ChSzviTKB1AnZcKB5mn5zS8jE',
      'Accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> upComingMovies() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTJhNWU2YjAxYzAyZTI2NDRhNTE5ZWM5MWQ2ZDY4OSIsIm5iZiI6MTczMjExNzc2NC40OTIsInN1YiI6IjY3M2UwNTA0YWIyZTI1MGY1NzBmN2I5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MEtgXEXHYKDYxvhkD0ChSzviTKB1AnZcKB5mn5zS8jE',
      'Accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> similarMovies(int movieID) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTJhNWU2YjAxYzAyZTI2NDRhNTE5ZWM5MWQ2ZDY4OSIsIm5iZiI6MTczMjExNzc2NC40OTIsInN1YiI6IjY3M2UwNTA0YWIyZTI1MGY1NzBmN2I5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MEtgXEXHYKDYxvhkD0ChSzviTKB1AnZcKB5mn5zS8jE',
      'Accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieID/similar?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('error');
    }
  }
}
