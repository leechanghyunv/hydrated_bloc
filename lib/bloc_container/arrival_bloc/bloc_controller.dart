import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/arrival_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';
part 'bloc_controller.freezed.dart';

class ArrivalController extends Bloc<ArrivalDataEvent, ArrivalDataState> with HydratedMixin{

  ArrivalController() : super(const _initial()) {

    on<ArrivalDataEvent>((event, emit) async {
      try {
        emit(_loading());
        final List<ArrivalModel> arriveData = await fetchSubApi(event.name);
        emit(_loaded(arriveData));
      }catch(e){
        emit(_error('Failed to fatch data -> ${e}'));
      }
    },
        transformer: (event, mapper) =>
            event.debounceTime(Duration(milliseconds: 250)).
            flatMap((mapper))); /// 텍스트필드 검색시 유용하게사용가능
  }


  @override
  void onTransition(Transition<ArrivalDataEvent,ArrivalDataState> transition){
    super.onTransition(transition);
  }
/// 데이터를 읽어옴
  @override
  ArrivalDataState? fromJson(Map<String, dynamic> json) {
    final ArrivalDataState arrivalDataState = json['arrival'];
    return arrivalDataState;
  }
/// 저장 가능한 현태로 변환후 데이터에 저장
  @override
  Map<String, dynamic>? toJson(ArrivalDataState state){
    return state.when(
        initial: () => {},
        loading: () => {},
        loaded: (arrival) => {'arrival' : state.toString()},
        error: (msg) => {'mag' : msg}
    );
  }
  }


