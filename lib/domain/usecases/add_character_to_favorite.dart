import 'package:rick_and_morty_app/domain/dto/dto.dart';
import 'package:rick_and_morty_app/domain/repositories/character_repository.dart';

class AddCharacterToFavorite {
  AddCharacterToFavorite(
    this.characterRepository,
    this.character,
    this.status,
  );

  final CharacterRepository characterRepository;
  final Character character;
  final bool status;

  Future<void> call() async {
    await characterRepository.changeCharacterFavoriteStatus(character.id, status);
  }
}
