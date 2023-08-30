// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/character_repository.dart' as _i4;
import '../data/repositories/location_repository.dart' as _i5;
import '../domain/domain.dart' as _i3;
import 'di.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.CharacterRepository>(() => appModule.userRepository);
    gh.factory<_i3.CharacterRepository>(
      () => _i4.RickAndMortyCharacterRepository(),
      instanceName: 'RickAndMortyCharacterRepository',
    );
    gh.factory<_i3.FetchCharactersByPlanet>(
        () => appModule.fetchCharactersByPlanet(gh<_i3.CharacterRepository>()));
    gh.factory<_i3.FetchFavoriteCharacters>(
        () => appModule.fetchFavoriteCharacters(gh<_i3.CharacterRepository>()));
    gh.factory<_i3.LocationRepository>(() => appModule.postRepository);
    gh.factory<_i3.LocationRepository>(
      () => _i5.RickAndMortyLocationRepository(),
      instanceName: 'RickAndMortyLocationRepository',
    );
    gh.factory<_i3.ChangeCharacterFavoriteStatus>(
        () => appModule.addCharacterToFavorite(gh<_i3.CharacterRepository>()));
    gh.factory<_i3.FetchAllPlanets>(
        () => appModule.fetchAllPlanets(gh<_i3.LocationRepository>()));
    return this;
  }
}

class _$AppModule extends _i6.AppModule {}
