import 'package:flutter/material.dart';
import 'package:marvel_universe/widgets/widgets.dart';

class ComicDetailSliverApp extends StatelessWidget {
  final String imageUrl;
  const ComicDetailSliverApp({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    const leadingIconsPadding = EdgeInsets.only(right: 8, top: 3, bottom: 3);
    return SliverAppBar(
      actions: const [
        RoundedIconWithBackground(
          backgroundColor: Color.fromARGB(255, 3, 15, 41),
          color: Color.fromARGB(255, 255, 198, 216),
          icon: Icons.favorite_sharp,
          margin: leadingIconsPadding,
        ),
        RoundedIconWithBackground(
          icon: Icons.share_rounded,
          backgroundColor: Color.fromARGB(255, 3, 15, 41),
          color: Color.fromARGB(255, 241, 240, 240),
          margin: leadingIconsPadding,
        ),
      ],
      leading: RoundedIconWithBackground(
        icon: Icons.arrow_back_ios_new_rounded,
        backgroundColor: const Color.fromARGB(255, 3, 15, 41),
        color: const Color.fromARGB(255, 233, 233, 233),
        onPressed: () => Navigator.pop(context),
        margin: const EdgeInsets.only(left: 8, top: 3, bottom: 3),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      elevation: 0,
      expandedHeight: 350,
      floating: false,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Positioned(
            child: FlexibleSpaceBar(
              background: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
