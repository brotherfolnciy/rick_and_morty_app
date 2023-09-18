import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/data/consts/consts.dart';
import 'package:rick_and_morty_app/data/repositories/character_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final repository = RickAndMortyCharacterRepository();
  test(
    'Fetch Characters By Planet Id',
    () async => repository.fetchCharactersByPlanetId(3),
  );

  test(
    'Change Character Favorite Status',
    () async {
      runApp(MaterialApp());
      SharedPreferences.setMockInitialValues({});

      final prefs = await SharedPreferences.getInstance();
      await repository.changeCharacterFavoriteStatusById(3, true);

      expect(prefs.getStringList(favoriteCharactersPrefsKey)?.contains('3'), true);

      await repository.changeCharacterFavoriteStatusById(3, false);

      expect(prefs.getStringList(favoriteCharactersPrefsKey)?.contains('3'), false);
    },
  );

  test(
    'Fetch Favorite Characters',
    () async {
      runApp(MaterialApp());
      SharedPreferences.setMockInitialValues({});

      final prefs = await SharedPreferences.getInstance();
      await repository.changeCharacterFavoriteStatusById(3, true);

      expect(prefs.getStringList(favoriteCharactersPrefsKey)?.contains('3'), true);

      final character = await repository.fetchFavoriteCharacters().then((l) => l.first);

      expect(character.id, 3);

      await repository.changeCharacterFavoriteStatusById(3, false);

      expect(prefs.getStringList(favoriteCharactersPrefsKey)?.contains('3'), false);
    },
  );
}
