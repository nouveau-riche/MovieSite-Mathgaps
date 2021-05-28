import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_site/models/movie.dart';

class HttpMethods {
  static Future<List<Movie>> fetchAllMovies() async {
    var url =
        Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=5d9ec214");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];

      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }
}

