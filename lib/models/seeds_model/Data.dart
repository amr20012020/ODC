class SeedsData
{
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  SeedsData({this.imageUrl,this.description,this.name,this.seedId});
  
  SeedsData.fromJson(dynamic json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['seedId'] = seedId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }
}