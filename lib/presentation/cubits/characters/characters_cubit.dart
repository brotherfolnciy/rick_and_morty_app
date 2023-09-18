import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty_app/domain/domain.dart';
import 'package:rick_and_morty_app/injection/di.dart';

part 'characters_state.dart';
part 'characters_cubit.freezed.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersState.initial());

  final logger = Logger();

  void fetchCharactersByPlanet(int planetId) async {
    try {
      emit(CharactersState.fetching());

      final fetchCharactersByPlanet = locator.get<FetchCharactersByPlanet>();

      final characters = await fetchCharactersByPlanet(planetId);

      emit(CharactersState.success(items: characters));
    } catch (e) {
      // TODO: Add error handling
      logger.e(e);
      emit(CharactersState.failure(message: 'error'));
    }
  }

  void fetchFavoriteCharacters() async {
    try {
      emit(CharactersState.fetching());

      final fetchFavoriteCharacters = locator.get<FetchFavoriteCharacters>();

      final characters = await fetchFavoriteCharacters();

      emit(CharactersState.success(items: characters));
    } catch (e) {
      // TODO: Add error handling
      logger.e(e);
      emit(CharactersState.failure(message: 'error'));
    }
  }

  void changeCharacterFavoriteStatus(Character character, bool status) async {
    state.whenOrNull(
      success: (items) async {
        try {
          final changeCharacterFavoriteStatus = locator.get<ChangeCharacterFavoriteStatus>();

          await changeCharacterFavoriteStatus(character, status);

          final index = items.indexOf(character);
          items[index] = character.copyWith(favorite: status);

          emit(CharactersState.success(items: items));
        } catch (e) {
          // TODO: Add error handling
          logger.e(e);
          emit(CharactersState.failure(message: 'error'));
        }
      },
    );
  }
}
