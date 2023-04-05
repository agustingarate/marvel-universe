import 'package:marvel_universe/models/models.dart';


enum ItemType { COVER, INTERIOR_STORY, EMPTY }

final itemTypeValues = EnumValues({
    "cover": ItemType.COVER,
    "": ItemType.EMPTY,
    "interiorStory": ItemType.INTERIOR_STORY
});

enum Extension { jpg, gif }

final extensionValues = EnumValues({
    "gif": Extension.gif,
    "jpg": Extension.jpg
});


enum UrlType { DETAIL, WIKI, COMICLINK, PURCHASE, READER, IN_APP_LINK }

final urlTypeValues = EnumValues({
    "comiclink": UrlType.COMICLINK,
    "detail": UrlType.DETAIL,
    "wiki": UrlType.WIKI,
    "inAppLink": UrlType.IN_APP_LINK,
    "purchase": UrlType.PURCHASE,
    "reader": UrlType.READER
});

class Stories {
    Stories({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    final int? available;
    final String? collectionUri;
    final List<StoriesItem>? items;
    final int? returned;

    factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

    factory Stories.fromMap(Map<String?, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
    );
}

class StoriesItem {
    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    final String? resourceUri;
    final String? name;
    final ItemType? type;

    factory StoriesItem.fromJson(String str) => StoriesItem.fromMap(json.decode(str));

    factory StoriesItem.fromMap(Map<String?, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]],
    );
}

class Thumbnail {
    Thumbnail({
        this.path,
        this.extension,
    });

    final String? path;
    final String? extension;

    factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

    factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );
}

class Url {
    Url({
        this.type,
        this.url,
    });

    final UrlType? type;
    final String? url;

    factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

    factory Url.fromMap(Map<String?, dynamic> json) => Url(
        type: urlTypeValues.map[json["type"]],
        url: json["url"],
    );
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map) : reverseMap =  map.map((k, v) => MapEntry(v, k));

    Map<T, String>? get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}