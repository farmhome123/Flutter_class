// To parse this JSON data, do
//
//     final getClass = getClassFromJson(jsonString);

import 'dart:convert';

List<GetClass> getClassFromJson(String str) =>
    List<GetClass>.from(json.decode(str).map((x) => GetClass.fromJson(x)));

String getClassToJson(List<GetClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetClass {
  GetClass({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.idC,
    this.idClass,
    this.nameClass,
    this.floor,
    this.phone,
    this.detail,
  });

  int id;
  String name;
  int latitude;
  int longitude;
  int idC;
  int idClass;
  String nameClass;
  String floor;
  String phone;
  String detail;

  factory GetClass.fromJson(Map<String, dynamic> json) => GetClass(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        idC: json["id_c "],
        idClass: json["id_class"],
        nameClass: json["name_class"],
        floor: json["floor"],
        phone: json["phone"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "id_c ": idC,
        "id_class": idClass,
        "name_class": nameClass,
        "floor": floor,
        "phone": phone,
        "detail": detail,
      };
}
