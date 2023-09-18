import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/domain/domain.dart';
import 'package:rick_and_morty_app/injection/di.dart';

part 'planets_state.dart';
part 'planets_cubit.freezed.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : super(PlanetsState.initial());

  void fetchAllPlanets() async {
    try {
      emit(PlanetsState.fetching());

      final fetchAllPlanets = locator.get<FetchAllPlanets>();

      final planets = await fetchAllPlanets();

      emit(PlanetsState.success(items: planets));
    } catch (e) {
      // TODO: Add error handling
      emit(PlanetsState.failure(message: 'error'));
    }
  }
}
