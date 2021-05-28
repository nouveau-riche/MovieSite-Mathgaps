import 'package:movie_site/core/http_methods.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/movie.dart';

class MyStore extends VxStore {
  List<Movie> movies = [];
}

class FetchMovie extends VxMutation<MyStore> {
  @override
  perform() async {
    final movieList = await HttpMethods.fetchAllMovies();
    store.movies = movieList;
  }
}
