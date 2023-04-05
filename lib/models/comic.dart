import 'package:marvel_universe/models/general_methods.dart';
import 'package:marvel_universe/models/models.dart';
import 'package:collection/collection.dart';

class Comic {
  Comic({
    this.id,
    this.digitalId,
    required this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    required this.variants,
    this.collections,
    this.collectedIssues,
    required this.dates,
    this.prices,
    required this.thumbnail,
    this.images,
    required this.creators,
    required this.characters,
    this.stories,
    this.events,
  });

  final int? id;
  final int? digitalId;
  final String title;
  final int? issueNumber;
  final VariantDescription? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final DiamondCode? diamondCode;
  final String? ean;
  final String? issn;
  final Format? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String? resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<Series> variants;
  final List<dynamic>? collections;
  final List<dynamic>? collectedIssues;
  final List<Date> dates;
  final List<Price>? prices;
  final Thumbnail thumbnail;
  final List<Thumbnail>? images;
  final Creators creators;
  final Characters characters;
  final Stories? stories;
  final Characters? events;

  factory Comic.fromJson(String str) => Comic.fromMap(json.decode(str));

  factory Comic.fromMap(Map<String?, dynamic> json) => Comic(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription:
            variantDescriptionValues.map[json["variantDescription"]],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: diamondCodeValues.map[json["diamondCode"]],
        ean: json["ean"],
        issn: json["issn"],
        format: formatValues.map[json["format"]],
        pageCount: json["pageCount"],
        textObjects: List<TextObject>.from(
            json["textObjects"].map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        series: Series.fromMap(json["series"]),
        variants:
            List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues:
            List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        images: List<Thumbnail>.from(
            json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        stories: Stories.fromMap(json["stories"]),
        events: Characters.fromMap(json["events"]),
      );

  String get getThumbnail => GeneralMethods.getThumbnail(thumbnail);

  get getWrittersNames {
    if (creators.returned! > 0) {
      final CreatorsItem? e = creators.items
          .firstWhereOrNull((element) => element.role == "writer");
      return e?.name;
    } 
      return null;
    
  }

  get getPencilersNames {
    if(creators.returned! > 0) {
      final CreatorsItem? e = creators.items.firstWhereOrNull((element) => element.role == "penciller");
      return e?.name;
    }
    return null;
  }

  get getOnSaleDate {
    final Date? d = dates
        .firstWhereOrNull((element) => element.type == DateType.ONSALE_DATE);
    return d?.date;
  }

  get getCoverArtists {
    if(creators.returned! > 0) {
      final CreatorsItem? e = creators.items.firstWhereOrNull((element) => element.role == "penciller (cover)");
      return e?.name;
    }
    return null;
  }
}
