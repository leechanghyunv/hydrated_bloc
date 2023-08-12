

import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_model.freezed.dart';
part 'counter_model.g.dart';

@freezed
class Counter with _$Counter{
  const factory Counter({
    required int value,
}) = _Counter;
  factory Counter.fromJson(Map<String,Object?> json) => _$CounterFromJson(json);
}