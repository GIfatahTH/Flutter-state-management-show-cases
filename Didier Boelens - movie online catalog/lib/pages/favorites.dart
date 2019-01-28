import 'package:flutter/material.dart';

import '../blocs/bloc_favorite.dart';
import '../blocs/bloc_provider.dart';

import '../widgets/favorite_widget.dart';

///FavoritesPage: page that lists the favorites and allows the deselection of any favorites;
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BloCFavorite bloc = BlocProvider.of<BloCFavorite>(context);
    return StateBuilder(
        stateID: "favoritesPageState",
        blocs: [bloc],
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Favorites Page'),
            ),
            body: (bloc.outFavorites != null)
                ? ListView.builder(
                    itemCount: bloc.outFavorites.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FavoriteWidget(
                        data: bloc.outFavorites[index],
                      );
                    },
                  )
                : Container()));
  }
}
