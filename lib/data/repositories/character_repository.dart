import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/data/consts/consts.dart';
import 'package:rick_and_morty_app/data/data.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart' as api;
import 'package:rick_and_morty_app/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Named('RickAndMortyCharacterRepository')
@Injectable(as: CharacterRepository)
class RickAndMortyCharacterRepository implements CharacterRepository {
  final _characterService = api.CharacterService();
  final _locationService = api.LocationService();
  final _mapper = Mappr();

  @override
  Future<void> changeCharacterFavoriteStatusById(int id, bool status) async {
    final prefs = await SharedPreferences.getInstance();

    final favoriteCharacterIds = prefs.getStringList(favoriteCharactersPrefsKey) ?? [];

    final exist = favoriteCharacterIds.contains(id.toString());

    if (exist) {
      if (!status) {
        favoriteCharacterIds.remove(id.toString());
      }
    } else {
      if (status) {
        favoriteCharacterIds.add(id.toString());
      }
    }

    prefs.setStringList(favoriteCharactersPrefsKey, favoriteCharacterIds);
  }

  @override
  Future<List<Character>> fetchCharactersByPlanetId(int id) async {
    final planet = await _locationService.getListOfLocations([id]).then((p) => p.first);

    final residentIds = <int>[];

    for (var residentUrl in planet.residents) {
      final id = int.parse(cropCharacterUrlToId(residentUrl));
      residentIds.add(id);
    }

    final residents = await _characterService.getListOfCharacters(residentIds);

    return Mappr().convertList(residents);
  }

  @override
  Future<List<Character>> fetchFavoriteCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteCharacterIds =
        (prefs.getStringList(favoriteCharactersPrefsKey) ?? []).map((e) => int.parse(e)).toList();

    final characters = await _characterService.getListOfCharacters(favoriteCharacterIds);
    return _mapper.convertList(characters);
  }

  @override
  Future<List<int>> getFavoriteCharacterIds() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(favoriteCharactersPrefsKey) ?? []).map((e) => int.parse(e)).toList();
  }
}
