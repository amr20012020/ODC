class Seeds
{
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seeds({
    this.seedId,
    this.name,
    this.description,
    this.imageUrl,
  });

  Seeds.fromJson(dynamic json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


  Map<String,dynamic> toJson()
  {
    final map = <String,dynamic>{};
    map['seedId'] = seedId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }



}