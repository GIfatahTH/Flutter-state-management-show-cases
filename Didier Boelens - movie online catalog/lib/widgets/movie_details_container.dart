import 'package:flutter/material.dart';
import '../blocs/bloc_movie_catalogue.dart';
import '../blocs/bloc_favorite.dart';
import '../blocs/bloc_provider.dart';

import '../widgets/movie_details_widget.dart';

class MovieDetailsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = BlocProvider.of<BloCMovieCatalogue>(context);

    return StateBuilder(
      stateID: "movieDetailsContainerState",
      blocs: [movieBloc],
      builder: (_) => (movieBloc.containerMovieCard == null)
          ? Center(
              child: Text('Click on a movie to see the details...'),
            )
          : MovieDetailsWidget(
              movieCard: movieBloc.containerMovieCard,
              movieCardState: movieBloc.movieCardState,
              boxFit: BoxFit.contain,
            ),
    );
  }
}
