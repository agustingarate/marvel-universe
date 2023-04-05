import 'package:flutter/material.dart';
import 'package:marvel_universe/models/models.dart';
import 'package:marvel_universe/providers/characters_provider.dart';
import 'package:provider/provider.dart';
import 'package:marvel_universe/widgets/widgets.dart';

class CharactersScreen extends StatelessWidget {
  List<Character> characters = [];
  CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    characters = Provider.of<CharactersProvider>(context).characters;
    const bigRadius = Radius.circular(24);
    const smallRadius = Radius.circular(8);

    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.63,
        ),
        itemCount: characters.length,
        itemBuilder: ((context, index) {
          return TitleAndImageCard(
            imageUrl: characters[index].getThumbnail,
            infoBoxHeight: 80,
            title: characters[index].name,
            borderRadius: const BorderRadius.only(
                topLeft: bigRadius,
                topRight: smallRadius,
                bottomLeft: smallRadius,
                bottomRight: bigRadius,),
            onTap: () => Navigator.pushNamed(context, "/characterDetailScreen"),
          );
        }),
      ),
    );
  }
}
