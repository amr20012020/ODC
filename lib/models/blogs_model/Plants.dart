class Plants
{
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunlight;
  int? temperature;

  Plants({
    this.plantId,
    this.name,
    this.description,
    this.imageUrl,
    this.sunlight,
    this.temperature,
    this.waterCapacity,
});

  Plants.fromJson(dynamic json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    sunlight = json['sunlight'];
    temperature = json['temperature'];
    waterCapacity = json['waterCapacity'];
  }


  Map<String,dynamic> toJson()
  {
    final map = <String,dynamic>{};
    map['plantId'] = plantId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['sunlight'] = sunlight;
    map['temperature'] = temperature;
    map['waterCapacity'] = waterCapacity;
    return map;
  }



}