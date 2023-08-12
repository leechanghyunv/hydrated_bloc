part of 'bloc_controller.dart';

@freezed
class DataFilterEvent with _$DataFilterEvent {
  const factory DataFilterEvent.FiltedList(String name,String line) = _FiltedList;
}