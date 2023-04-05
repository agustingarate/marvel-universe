// To parse this JSON data, do
//
//     final comicsRespondeModel = comicsRespondeModelFromMap(jsonString?);
import 'package:marvel_universe/models/models.dart';

class ComicsResponseModel {
  ComicsResponseModel({
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
  final ComicData data;

  factory ComicsResponseModel.fromJson(String str) =>
      ComicsResponseModel.fromMap(json.decode(str));

  factory ComicsResponseModel.fromMap(Map<String?, dynamic> json) =>
      ComicsResponseModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: ComicData.fromMap(json["data"]),
      );
}

class ComicData {
  ComicData({
    this.offset,
    this.limit,
    this.total,
    this.count,
    required this.comics,
  });

  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Comic> comics;

  factory ComicData.fromJson(String str) => ComicData.fromMap(json.decode(str));

  factory ComicData.fromMap(Map<String?, dynamic> json) => ComicData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        comics: List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
      );
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    required this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<Series> items;
  final int? returned;

  factory Characters.fromJson(String str) =>
      Characters.fromMap(json.decode(str));

  factory Characters.fromMap(Map<String?, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromMap(x))),
        returned: json["returned"],
      );
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

  factory Series.fromMap(Map<String?, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );
}

class Creators {
  Creators({
    this.available,
    this.collectionUri,
    required this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<CreatorsItem> items;
  final int? returned;

  factory Creators.fromJson(String str) => Creators.fromMap(json.decode(str));

  factory Creators.fromMap(Map<String?, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(
            json["items"].map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"],
      );
}

class CreatorsItem {
  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  final String? resourceUri;
  final String? name;
  final String? role;

  factory CreatorsItem.fromJson(String str) =>
      CreatorsItem.fromMap(json.decode(str));

  factory CreatorsItem.fromMap(Map<String?, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );
}

class Date {
  Date({
    this.type,
    this.date,
  });

  final DateType? type;
  final String? date;

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  factory Date.fromMap(Map<String?, dynamic> json) => Date(
        type: dateTypeValues.map[json["type"]],
        date: json["date"],
      );
}

enum DateType { ONSALE_DATE, FOC_DATE, UNLIMITED_DATE, DIGITAL_PURCHASE_DATE }

final dateTypeValues = EnumValues({
  "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
  "focDate": DateType.FOC_DATE,
  "onsaleDate": DateType.ONSALE_DATE,
  "unlimitedDate": DateType.UNLIMITED_DATE
});

enum DiamondCode { MAR200975, EMPTY }

final diamondCodeValues =
    EnumValues({"": DiamondCode.EMPTY, "MAR200975": DiamondCode.MAR200975});

enum Format { COMIC, DIGITAL_VERTICAL_COMIC }

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Digital Vertical Comic": Format.DIGITAL_VERTICAL_COMIC
});

class Price {
  Price({
    this.type,
    this.price,
  });

  final PriceType? type;
  final double? price;

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  factory Price.fromMap(Map<String?, dynamic> json) => Price(
        type: priceTypeValues.map[json["type"]],
        price: json["price"].toDouble(),
      );
}

enum PriceType { PRINT_PRICE, DIGITAL_PURCHASE_PRICE }

final priceTypeValues = EnumValues({
  "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
  "printPrice": PriceType.PRINT_PRICE
});

class TextObject {
  TextObject({
    this.type,
    this.language,
    this.text,
  });

  final String? type;
  final String? language;
  final String? text;

  factory TextObject.fromJson(String str) =>
      TextObject.fromMap(json.decode(str));

  factory TextObject.fromMap(Map<String?, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
      );
}

enum VariantDescription { EMPTY, VARIANT }

final variantDescriptionValues = EnumValues(
    {"": VariantDescription.EMPTY, "Variant": VariantDescription.VARIANT});
