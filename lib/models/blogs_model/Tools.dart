class Tools
{
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tools({
    this.toolId,
    this.name,
    this.description,
    this.imageUrl,
  });

  Tools.fromJson(dynamic json){
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


  Map<String,dynamic> toJson()
  {
    final map = <String,dynamic>{};
    map['toolId'] = toolId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }



}