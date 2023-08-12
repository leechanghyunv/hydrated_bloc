part of'bloc_controller.dart';

@freezed
class ArrivalDataEvent with _$ArrivalDataEvent {
  const factory ArrivalDataEvent.ArrivalList(String name) = _ArrivalList;
}