import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/data/data.dart';
import 'package:rick_and_morty_app/domain/domain.dart';

import 'di.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => locator.init();

@module
abstract class AppModule {
  @injectable
  CharacterRepository get userRepository => RickAndMortyCharacterRepository();

  @injectable
  LocationRepository get postRepository => RickAndMortyLocationRepository();

  FetchAllPlanets fetchAllPlanets(LocationRepository repository) => FetchAllPlanets(repository);

  ChangeCharacterFavoriteStatus addCharacterToFavorite(CharacterRepository repository) =>
      ChangeCharacterFavoriteStatus(repository);

  FetchCharactersByPlanet fetchCharactersByPlanet(CharacterRepository repository) =>
      FetchCharactersByPlanet(repository);

  FetchFavoriteCharacters fetchFavoriteCharacters(CharacterRepository repository) =>
      FetchFavoriteCharacters(repository);
}
