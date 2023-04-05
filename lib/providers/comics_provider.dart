import 'package:http/http.dart' as http;
import 'package:marvel_universe/models/models.dart';
import 'package:marvel_universe/providers/provider_class.dart';

class ComicsProvider extends ProviderClass {
  ComicsProvider() {
    getComics();
  }

  List<Comic> comics = [];

  getComics() async {
    final response = await http.get(
      Uri.https(
        super.domain,
        '/v1/public/comics',
        {
          'orderBy': '-focDate',
          'apikey': super.key,
          'ts': super.ts,
          'hash': super.hash,
          'format': 'comic',
        },
      ),
    );
    final comicsResponse = ComicsResponseModel.fromJson(response.body);
    comics = comicsResponse.data.comics;
    notifyListeners();
  }

  getComicById(id) async {
    final response = await http.get(
      Uri.https(
        super.domain,
        '/v1/public/comics/$id',
        {
          'apikey': super.key,
          'ts': super.ts,
          'hash': super.hash,
        },
      ),
    );
    final comicResponse = ComicsResponseModel.fromJson(response.body);
    return comicResponse.data.comics[0];
  }

  getComicVariants(List<Series> comicVariants ) async {
    final List<Comic> comics = [];
    for(Series s in comicVariants){
      final comicId = s.resourceUri!.replaceAll("http://gateway.marvel.com/v1/public/comics/", "");
      Comic comic =  await getComicById(comicId) as Comic;
      comics.add(comic);
    }
    return comics;
  
  }
}
