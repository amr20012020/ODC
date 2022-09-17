import 'Data.dart';

class BlogsModel{
  BlogsModel({this.type,this.message,this.data});

  String? type;
  String? message;
  BlogsData? data;

  BlogsModel.fromJson(dynamic json){
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? BlogsData.fromJson(json['data']) : null;
  }

  Map<String,dynamic> toJson(){
    final map = <String, dynamic>{};
    map['type'] = type;
    map['message'] = message;
    if(data != null){
      map['data'] = data?.toJson();
    }
    return map;
  }
}