part of 'bloc_controller.dart';

@freezed
class DataFilterState with _$DataFilterState{
  const factory DataFilterState.initial() = _Initial;
  const factory DataFilterState.loading() = _loading;
  const factory DataFilterState.loaded(List<SubwayModel> filtedData) = _loaded;
  const factory DataFilterState.error(String? message) = _error;
}