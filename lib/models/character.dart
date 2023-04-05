import 'package:marvel_universe/models/general_methods.dart';
import 'package:marvel_universe/models/models.dart';


class Character {
  Character({
    this.id,
    required this.name,
    this.description,
    this.modified,
    required this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  final int? id;
  final String name;
  final String? description;
  final String? modified;
  final Thumbnail thumbnail;
  final String? resourceUri;
  final Comics? comics;
  final Comics? series;
  final Stories? stories;
  final Comics? events;
  final List<Url>? urls;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"] ?? "No name",
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromMap(json["comics"]),
        series: Comics.fromMap(json["series"]),
        stories: Stories.fromMap(json["stories"]),
        events: Comics.fromMap(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
      );

      String get getThumbnail => GeneralMethods.getThumbnail(thumbnail);

}