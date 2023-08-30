import 'package:rick_and_morty_app/domain/dto/dto.dart';

abstract class CharacterRepository {
  Future<void> changeCharacterFavoriteStatus(int id, bool status);

  Future<List<Character>> fetchCharactersByPlanet(String planetId);

  Future<List<Character>> fetchFavoriteCharacters();
}
