import 'package:rick_and_morty_app/domain/dto/dto.dart';
import 'package:rick_and_morty_app/domain/repositories/character_repository.dart';

class FetchCharactersByPlanet {
  FetchCharactersByPlanet(this.characterRepository);

  final CharacterRepository characterRepository;

  Future<List<Character>> call(int planetId) async {
    final favoriteCharacterIds = await characterRepository.fetchFavoriteCharacterIds();

    final characters = await characterRepository.fetchCharactersByPlanetId(planetId);

    final result = <Character>[];

    for (var character in characters) {
      final item = character.copyWith(favorite: favoriteCharacterIds.contains(character.id));
      result.add(item);
    }

    return result;
  }
}
