import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:rick_and_morty_app/domain/domain.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart' as api;

part 'mapper.g.dart';

@AutoMappr([
  MapType<api.Character, Character>(),
  MapType<api.Location, Location>(),
  MapType<api.CharacterLocation, CharacterLocation>(),
])
class Mappr extends $Mappr {}
