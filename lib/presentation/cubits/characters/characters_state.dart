part of 'characters_cubit.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.initial() = _Initial;

  const factory CharactersState.fetching() = _Fetching;

  const factory CharactersState.success({required List<Character> items}) = _Success;

  const factory CharactersState.failure({required String message}) = _Failure;
}
