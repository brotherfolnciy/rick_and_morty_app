// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:rick_and_morty_app/data/mapper/mapper.dart}
/// Available mappings:
/// - `api.Character` → `Character`.
/// - `api.Location` → `Location`.
/// - `api.CharacterLocation` → `CharacterLocation`.
/// {@endtemplate}
class $Mappr implements AutoMapprInterface {
  const $Mappr();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<api.Character>() ||
            sourceTypeOf == _typeOf<api.Character?>()) &&
        (targetTypeOf == _typeOf<Character>() ||
            targetTypeOf == _typeOf<Character?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<api.Location>() ||
            sourceTypeOf == _typeOf<api.Location?>()) &&
        (targetTypeOf == _typeOf<Location>() ||
            targetTypeOf == _typeOf<Location?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<api.CharacterLocation>() ||
            sourceTypeOf == _typeOf<api.CharacterLocation?>()) &&
        (targetTypeOf == _typeOf<CharacterLocation>() ||
            targetTypeOf == _typeOf<CharacterLocation?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _modules) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
      Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>((item) => _convert(item, canReturnNull: true));
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:rick_and_morty_app/data/mapper/mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<api.Character>() ||
            sourceTypeOf == _typeOf<api.Character?>()) &&
        (targetTypeOf == _typeOf<Character>() ||
            targetTypeOf == _typeOf<Character?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__api_Character__To__Character((model as api.Character?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<api.Location>() ||
            sourceTypeOf == _typeOf<api.Location?>()) &&
        (targetTypeOf == _typeOf<Location>() ||
            targetTypeOf == _typeOf<Location?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__api_Location__To__Location((model as api.Location?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<api.CharacterLocation>() ||
            sourceTypeOf == _typeOf<api.CharacterLocation?>()) &&
        (targetTypeOf == _typeOf<CharacterLocation>() ||
            targetTypeOf == _typeOf<CharacterLocation?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__api_CharacterLocation__To__CharacterLocation(
          (model as api.CharacterLocation?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  Character _map__api_Character__To__Character(api.Character? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Character → Character failed because Character was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Character, Character> to handle null values during mapping.');
    }
    return Character(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      type: model.type,
      gender: model.gender,
      origin: _map__api_CharacterLocation__To__CharacterLocation_Nullable(
          model.origin),
      location: _map__api_CharacterLocation__To__CharacterLocation_Nullable(
          model.location),
      image: model.image,
      episode: model.episode,
      url: model.url,
      created: model.created,
    );
  }

  Location _map__api_Location__To__Location(api.Location? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Location → Location failed because Location was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Location, Location> to handle null values during mapping.');
    }
    return Location(
      id: model.id,
      name: model.name,
      type: model.type,
      dimension: model.dimension,
      residents: model.residents,
      url: model.url,
      created: model.created,
    );
  }

  CharacterLocation _map__api_CharacterLocation__To__CharacterLocation(
      api.CharacterLocation? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CharacterLocation → CharacterLocation failed because CharacterLocation was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CharacterLocation, CharacterLocation> to handle null values during mapping.');
    }
    return CharacterLocation(
      name: model.name,
      url: model.url,
    );
  }

  CharacterLocation?
      _map__api_CharacterLocation__To__CharacterLocation_Nullable(
          api.CharacterLocation? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return CharacterLocation(
      name: model.name,
      url: model.url,
    );
  }
}
