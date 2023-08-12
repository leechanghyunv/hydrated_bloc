

import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_model.freezed.dart';
part 'data_model.g.dart';

@Freezed()
class SubwayModel with _$SubwayModel{
  const factory SubwayModel({
    required String subname,
    required String engname,
    required double lat,
    required double lng,
    required String line_ui,
    required int subwayid,
    required String line,
    required String heading,
    @Default(false) bool? isSelected,
    @Default(0.0) num? km,

  }) = _SubwayModel;
  factory SubwayModel.fromJson(Map<String, Object?> json) => _$SubwayModelFromJson(json);
}
extension MutableSubwayModelExtension on SubwayModel {
  SubwayModel setKm(double newKm) {
    return copyWith(km: newKm);
  }
}

class InsideAssets {
  Future<List<SubwayModel>> fetchInside () async {
    final  jsonData = await rootBundle.loadString('assets/test.json');
    final List<dynamic> data = jsonDecode(jsonData)['subwaydata'];
    return data.map((e) => SubwayModel.fromJson(e)).toList();
  }
}

Future<List<SubwayModel>> searchSubway({required name, String? line}) async {

  final InsideAssets insideAssets = InsideAssets();
  List<SubwayModel> model = await insideAssets.fetchInside();

  if(line != null){
    final List<SubwayModel> filtedState = model.where((e) => e.subname == name && e.line == line).toList();
    return filtedState;
  } else {
    throw(e.toString());
  }
}