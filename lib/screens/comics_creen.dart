import 'package:flutter/material.dart';
import 'package:marvel_universe/providers/comics_provider.dart';
import 'package:marvel_universe/models/models.dart';
import 'package:marvel_universe/widgets/comic_card.dart';
import 'package:provider/provider.dart';

class ComicsScreen extends StatelessWidget {
  late List<Comic> comics = [];
  late ComicsProvider comicsProvider;

  ComicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    comicsProvider = Provider.of<ComicsProvider>(context);
    comics = comicsProvider.comics;
    return Scaffold(
      body: ListView.builder(
        itemCount: comics.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            child: ComicCard(
              comic: comics[index],
            ),
            onTap: () => Navigator.pushNamed(context, "/comicDetailScreen", arguments: comics[index]),
          );
        }),
      ),
    );
  }
}
