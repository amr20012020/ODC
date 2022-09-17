import 'Data.dart';

class PlantsModel {
  String? type;
  String? message;
  List<Data>? data;

  PlantsModel({this.data, this.message, this.type});

  PlantsModel.fromJson(dynamic json)
  {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}