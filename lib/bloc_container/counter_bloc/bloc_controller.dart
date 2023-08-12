
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';
part 'bloc_controller.freezed.dart';

class CounterController extends Bloc<CounterEvent,String> with HydratedMixin{
  CounterController() : super('Test Hydrate Bloc'){


    on<_Increment>((event, emit) {
      emit('Upgeade my ability');
    });

    on<_Decrement>((event, emit) {
      emit('Good');
    });
  }

  @override
  String fromJson(Map<String, dynamic> json) => json['count'];

  @override
  Map<String, dynamic>? toJson(String state) => {'count' : state};
}
