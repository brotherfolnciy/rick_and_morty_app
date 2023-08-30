import 'package:rick_and_morty_app/domain/dto/dto.dart';
import 'package:rick_and_morty_app/domain/repositories/location_repository.dart';

class FetchAllPlanets {
  FetchAllPlanets(this.locationRepository);

  final LocationRepository locationRepository;

  Future<List<Location>> call() async {
    return await locationRepository.fetchAllPlanets();
  }
}
