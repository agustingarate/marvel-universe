import 'package:marvel_universe/models/models.dart';

class GeneralMethods {
  

  static String getThumbnail (Thumbnail? thumbnail) => '${thumbnail!.path}.${thumbnail.extension}' ;
}