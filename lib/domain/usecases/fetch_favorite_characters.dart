import 'package:rick_and_morty_app/domain/dto/dto.dart';
import 'package:rick_and_morty_app/domain/repositories/character_repository.dart';

class FetchFavoriteCharacters {
  FetchFavoriteCharacters(this.characterRepository);

  final CharacterRepository characterRepository;

  Future<List<Character>> call() async {
    return await characterRepository.fetchFavoriteCharacters();
  }
}
