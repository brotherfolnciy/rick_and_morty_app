import 'package:flutter_test/flutter_test.dart';

import 'package:rick_and_morty_app/data/repositories/location_repository.dart';

void main() {
  final repository = RickAndMortyLocationRepository();
  test(
    'Fetch All Planets',
    () async => repository.fetchAllPlanets(),
  );
}
