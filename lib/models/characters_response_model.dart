// To parse this JSON data, do
//
//     final CharactersResponseModel = CharactersResponseModelFromMap(jsonString);

import 'package:marvel_universe/models/models.dart';

class CharactersResponseModel {
  CharactersResponseModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    required this.data,
  });

  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final CharacterData data;

  factory CharactersResponseModel.fromJson(String str) =>
      CharactersResponseModel.fromMap(json.decode(str));

  factory CharactersResponseModel.fromMap(Map<String, dynamic> json) =>
      CharactersResponseModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: CharacterData.fromMap(json["data"]),
      );
}

class CharacterData {
  CharacterData({
    this.offset,
    this.limit,
    this.total,
    this.count,
    required this.results,
  });

  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Character> results;

  factory CharacterData.fromJson(String str) =>
      CharacterData.fromMap(json.decode(str));

  factory CharacterData.fromMap(Map<String, dynamic> json) => CharacterData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results:
            List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
      );
}



class Comics {
  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<ComicsItem>? items;
  final int? returned;

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromMap(x))),
        returned: json["returned"],
      );
}

class ComicsItem {
  ComicsItem({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory ComicsItem.fromJson(String str) =>
      ComicsItem.fromMap(json.decode(str));
  factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );
}
