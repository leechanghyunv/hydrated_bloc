import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/data_model.dart';

part 'bloc_state.dart';
part 'bloc_event.dart';
part 'bloc_controller.freezed.dart';

class FilterContorller extends Bloc<DataFilterEvent,DataFilterState>{
  FilterContorller() : super(const _Initial()){

    on<DataFilterEvent>((event, emit) async {
      try{
        emit(_loading());
        final List<SubwayModel> filtedData = await searchSubway(name: event.name, line: event.line);
        emit(DataFilterState.loaded(filtedData));
      }catch(e){
        emit(DataFilterState.error('Failed to fatch code data -> ${e}'));
      }
    });
  }
}