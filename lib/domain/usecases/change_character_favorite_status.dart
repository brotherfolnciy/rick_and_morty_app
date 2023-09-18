import 'package:rick_and_morty_app/domain/dto/dto.dart';
import 'package:rick_and_morty_app/domain/repositories/character_repository.dart';

class ChangeCharacterFavoriteStatus {
  ChangeCharacterFavoriteStatus(
    this.characterRepository,
  );

  final CharacterRepository characterRepository;

  Future<void> call(
    Character character,
    bool status,
  ) async {
    await characterRepository.changeCharacterFavoriteStatusById(character.id, status);
  }
}
