import 'package:rick_and_morty_app/domain/dto/dto.dart';
import 'package:rick_and_morty_app/domain/repositories/character_repository.dart';

class FetchCharactersByPlanet {
  FetchCharactersByPlanet(this.characterRepository, this.planetId);

  final CharacterRepository characterRepository;
  final String planetId;

  Future<List<Character>> call() async {
    return await characterRepository.fetchCharactersByPlanet(planetId);
  }
}
