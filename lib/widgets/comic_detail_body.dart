import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_universe/models/models.dart';
import 'package:marvel_universe/providers/characters_provider.dart';
import 'package:marvel_universe/providers/comics_provider.dart';
import 'package:marvel_universe/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ComicDetailBody extends StatelessWidget {
  final Comic comic;
  late CharactersProvider charactersProvider;
  late ComicsProvider comicsProvider;
  ComicDetailBody({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    charactersProvider = Provider.of<CharactersProvider>(context);
    comicsProvider = Provider.of<ComicsProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 233, 233, 233),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic.title,
                    style: GoogleFonts.secularOne(
                      fontSize: 40,
                      color: const Color.fromARGB(255, 37, 37, 37),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    comic.getOnSaleDate,
                    style: GoogleFonts.heebo(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CreatorsText(
                    creatorType: "Writters",
                    name: comic.getWrittersNames ?? "No Writters",
                    icon: Icons.emoji_people_rounded,
                  ),
                  CreatorsText(
                    creatorType: "Pencillers",
                    name: comic.getPencilersNames ?? "No pencilers",
                    icon: Icons.draw,
                  ),
                  CreatorsText(
                    creatorType: "Cover Artists",
                    name: comic.getCoverArtists ?? "No pencilers",
                    icon: Icons.auto_awesome_outlined,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      comic.description ??
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel arcu eget nunc malesuada malesuada. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In accumsan rhoncus augue, sit amet pellentesque mi lacinia eu. Sed lacinia metus et dui maximus cursus. Praesent at cursus nisl, non convallis ante. Duis et luctus enim. Donec in velit turpis. Nullam eu maximus elit. Donec eros nulla, tempor eget iaculis sit amet, mattis sit amet sapien. Mauris vel ligula eu quam egestas cursus. Fusce vitae nibh vitae ex tempus ultrices sed ac nisi. Morbi vel enim mi. Quisque ac consequat dolor, non sollicitudin elit. Donec ultricies aliquam viverra. Praesent aliquam porta metus, eget mollis nisi volutpat quis.
                    ''',
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              FutureBuilder<dynamic>(
                  future: charactersProvider
                      .getCharactersOfComic(comic.characters.items),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return SectionOne(
                        title: "Characters",
                        itemLenght: snapshot.data.length,
                        itemBuilder: ((context, index) {
                          return TitleAndImageCard(
                            imageUrl: snapshot.data[index].getThumbnail,
                            infoBoxHeight: 70,
                            width: 175,
                            title: snapshot.data[index].name,
                            margin: const EdgeInsets.all(10),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          );
                        }),
                      );
                    }
                  }),
              FutureBuilder<dynamic>(
                  future: comicsProvider.getComicVariants(comic.variants),
                  builder: (context, snapshot) {
                    return SectionOne(
                      title: "Similars",
                      itemLenght:
                          snapshot.data == null ? 0 : snapshot.data.length,
                      itemBuilder: ((context, index) {
                        if (snapshot.hasData) {
                          return TitleAndImageCard(
                            imageUrl: snapshot.data[index].getThumbnail,
                            infoBoxHeight: 70,
                            width: 175,
                            title: snapshot.data[index].title,
                            margin: const EdgeInsets.all(10),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            onTap: () => Navigator.pushNamed(
                                context, "/comicDetailScreen",
                                arguments: snapshot.data[index]),
                          );
                        } else {
                          return const Center(
                            child: Text("No data"),
                          );
                        }
                      }),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class CreatorsText extends StatelessWidget {
  final String creatorType;
  final String? name;
  final IconData icon;
  const CreatorsText(
      {super.key, required this.creatorType, this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color.fromARGB(255, 6, 24, 97),
          size: 20,
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          '$creatorType:',
          style: GoogleFonts.heebo(
            fontSize: 18,
            color: const Color.fromARGB(255, 6, 24, 97),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          '$name',
          style: GoogleFonts.heebo(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class SectionOne extends StatelessWidget {
  final String title;
  final int itemLenght;
  final Widget Function(BuildContext, int) itemBuilder;

  const SectionOne({
    super.key,
    required this.title,
    required this.itemLenght,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: GoogleFonts.anton(
            fontSize: 30,
            color: const Color.fromARGB(255, 13, 36, 62),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        itemLenght == 0
            ? Column(
                children: [
                  Center(
                    child: Text(
                      "There's not any ${title.toLowerCase()}",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView.builder(
                  itemCount: itemLenght,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: itemBuilder,
                ),
              ),
      ],
    );
  }
}
