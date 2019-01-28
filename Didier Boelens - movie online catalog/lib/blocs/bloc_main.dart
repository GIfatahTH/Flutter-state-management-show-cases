import 'dart:collection';

import '../api/tmdb_api.dart';
import '../models/movie_genre.dart';

import 'bloc_setting.dart';

// ApplicationBloc (on top of everything), responsible for delivering the list of all movie genres;
class BloCMain extends BloCSetting {
  BloCMain() {
    // Read all genres from Internet
    api.movieGenres().then((list) {
      outMovieGenres = UnmodifiableListView<MovieGenre>(list.genres);
    });
  }
  List<MovieGenre> outMovieGenres = [];
}
