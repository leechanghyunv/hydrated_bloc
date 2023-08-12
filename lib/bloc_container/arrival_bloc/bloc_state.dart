part of'bloc_controller.dart';
/// state는 소문자
@freezed
class ArrivalDataState with _$ArrivalDataState{
  const factory ArrivalDataState.initial() = _initial;
  const factory ArrivalDataState.loading() = _loading;
  const factory ArrivalDataState.loaded(List<ArrivalModel> arrivalmodel) = _loaded;
  const factory ArrivalDataState.error(String? msg) = _error;
}