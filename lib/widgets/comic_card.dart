import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_universe/models/models.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;
  const ComicCard({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width - 35;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Image.network(
            comic.getThumbnail,
            width: cardWidth,
            colorBlendMode: BlendMode.color,
          ),
          Positioned(
            bottom: 0,
            child: ComicCardInformation(width: cardWidth, comic: comic),
          ),
        ],
      ),
    );
  }
}

class ComicCardInformation extends StatelessWidget {
  final double width;
  final Comic comic;
  const ComicCardInformation(
      {Key? key, required this.width, required this.comic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.lato(
      color: Colors.white,
      fontSize: 17,
    );

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(188, 0, 0, 0),
      ),
      height: 180,
      padding: const EdgeInsets.all(15),
      width: width,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            child: Text(
              comic.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 30,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (comic.getWrittersNames ?? "Unknown Author").toString(),
                    maxLines: 2,
                    style: textStyle,
                  ),
                  Text(
                    (comic.getOnSaleDate ?? "Unknown Date").toString(),
                    maxLines: 2,
                    style: textStyle,
                  ),
                ],
              ),
              Expanded(child: Column()),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
