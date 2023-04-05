import 'package:flutter/material.dart';
import 'package:marvel_universe/providers/characters_provider.dart';
import 'package:marvel_universe/providers/comics_provider.dart';
import 'package:provider/provider.dart';
import 'package:marvel_universe/screens/screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ComicsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CharactersProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/tapBarScreen",
      routes: {
        "/tapBarScreen": (_) => const TapBarScreen(),
        "/comicDetailScreen": (_) => ComicDetailScreen(),
        "/comics": (_) => ComicsScreen(),
        "/characters": (_) => CharactersScreen(),
        "/characterDetailScreen": (_) => const CharacterDetailScreen(),
        "/favourites": (_) => const FavouritesScreen(),
      },
    );
  }
}
