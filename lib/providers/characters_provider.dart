import 'package:http/http.dart' as http;
import 'package:marvel_universe/models/models.dart';
import 'package:marvel_universe/providers/provider_class.dart';

class CharactersProvider extends ProviderClass {
  CharactersProvider() {
    getAllCharacters();
  }

  List<Character> characters = [];

  getAllCharacters() async {
    final response = await http.get(
      Uri.https(
        super.domain,
        '/v1/public/characters',
        {
          'apikey': super.key,
          'ts': super.ts,
          'hash': super.hash,
        },
      ),
    );
    final charactersResponse = CharactersResponseModel.fromJson(response.body);
    characters = charactersResponse.data.results;
    notifyListeners();
  }

  getCharactersOfComic(List<Series> charactersResource) async {
    final List<Character> characters = [];
    for(Series s in charactersResource){
      final characterId = s.resourceUri!.replaceAll("http://gateway.marvel.com/v1/public/characters/", "");
      Character character =  await getCharacterFromId(characterId) as Character;
      characters.add(character);
    }
    return characters;
  }

  getCharacterFromId(String id) async {
    final response = await http.get(Uri.https(
      super.domain, 
      '/v1/public/characters/$id',
      {
        'apikey': super.key,
        'ts': super.ts,
        'hash': super.hash,
      }
    ));
    final characterResponse = CharactersResponseModel.fromJson(response.body);
    return characterResponse.data.results[0];
  }
}
