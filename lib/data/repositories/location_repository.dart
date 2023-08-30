import 'package:rick_and_morty_api/rick_and_morty_api.dart' as api;
import 'package:rick_and_morty_app/data/data.dart';
import 'package:rick_and_morty_app/domain/domain.dart';

class RickAndMortyLocationRepository extends LocationRepository {
  final _locationService = api.LocationService();
  final _mapper = Mappr();

  @override
  Future<List<Location>> fetchAllPlanets() async {
    final filter = api.LocationFilters(type: 'Planet');
    final locations = await _locationService.getFilteredLocations(filter);

    return _mapper.convertList(locations);
  }
}
