class Data{
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? price;
  int? sunLight;
  int? temperature;

  Data({
    this.plantId,
    this.name,
    this.description,
    this.imageUrl,
    this.waterCapacity,
    this.price,
    this.sunLight,
    this.temperature,});

  Data.fromJson(dynamic json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String,dynamic> toJson(){
    final map = <String, dynamic>{};
    map['plantId'] = plantId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['price'] = price;
    map['waterCapacity'] = waterCapacity;
    map['sunLight'] = sunLight;
    map['temperature'] = temperature;
    return map;
  }
}