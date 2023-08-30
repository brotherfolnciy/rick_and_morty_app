part of 'planets_cubit.dart';

@freezed
class PlanetsState with _$PlanetsState {
  const factory PlanetsState.initial() = _Initial;

  const factory PlanetsState.fetching() = _Fetching;

  const factory PlanetsState.success({required List<Location> items}) = _Success;

  const factory PlanetsState.failure({required String message}) = _Failure;
}
