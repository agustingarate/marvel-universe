import 'package:flutter/material.dart';
import 'package:marvel_universe/models/models.dart';
import 'package:marvel_universe/widgets/comic_detail_body.dart';
import 'package:marvel_universe/widgets/comic_detail_sliver_app.dart';

class ComicDetailScreen extends StatelessWidget {
  late Comic comic;
  ComicDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    comic = ModalRoute.of(context)!.settings.arguments as Comic;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ComicDetailSliverApp(
            imageUrl: comic.getThumbnail,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ComicDetailBody(
                  comic: comic,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
    );
  }
}
