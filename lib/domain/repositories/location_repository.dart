import 'package:rick_and_morty_app/domain/dto/dto.dart';

abstract class LocationRepository {
  Future<List<Location>> fetchAllPlanets();
}
