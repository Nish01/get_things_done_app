import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pairs = appState.favorites;
    final theme = Theme.of(context);

    if (pairs.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${pairs.length} favorites:'),
        ),
        for (var pair in pairs)
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
              color: theme.colorScheme.primary,
              onPressed: () {
                appState.removeFavorite(pair);
              },
            ),
            title: Text(
              pair.asLowerCase,
              semanticsLabel: pair.asPascalCase,
            ),
          ),
      ],
    );
  }
}
