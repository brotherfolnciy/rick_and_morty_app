import 'package:rick_and_morty_app/domain/domain.dart';

abstract class CharacterRepository {
  Future<void> changeCharacterFavoriteStatusById(int id, bool status);

  Future<List<Character>> fetchCharactersByPlanetId(int id);

  Future<List<Character>> fetchFavoriteCharacters();

  Future<List<int>> getFavoriteCharacterIds();
}
