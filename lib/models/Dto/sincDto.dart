// To parse this JSON data, do
//
//     final sincDto = sincDtoFromJson(jsonString);

import 'dart:convert';

SincDto sincDtoFromJson(String str) => SincDto.fromJson(json.decode(str));

String sincDtoToJson(SincDto data) => json.encode(data.toJson());

class SincDto {
  LivestockDto livestockDto;

  SincDto({
    required this.livestockDto,
  });

  factory SincDto.fromJson(Map<String, dynamic> json) => SincDto(
        livestockDto: LivestockDto.fromJson(json["livestock"]),
      );

  Map<String, dynamic> toJson() => {
        "livestock": livestockDto.toJson(),
      };
}

class LivestockDto {
  int id;
  String name;
  List<SiloDto> siloDto;

  LivestockDto({
    required this.id,
    required this.name,
    required this.siloDto,
  });

  factory LivestockDto.fromJson(Map<String, dynamic> json) => LivestockDto(
        id: int.tryParse(json["id"]) ?? 0,
        name: json["name"],
        siloDto:
            List<SiloDto>.from(json["silos"].map((x) => SiloDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "silos": List<dynamic>.from(siloDto.map((x) => x.toJson())),
      };
}

class SiloDto {
  int id;
  String siloName;
  double height;
  int volume;
  int risk;
  SensorDto sensor;

  SiloDto({
    required this.id,
    required this.siloName,
    required this.height,
    required this.volume,
    required this.risk,
    required this.sensor,
  });

  factory SiloDto.fromJson(Map<String, dynamic> json) => SiloDto(
        id: int.tryParse(json["id"]) ?? 0,
        siloName: json["siloName"],
        height: double.tryParse(json["height"]) ?? 0,
        volume: int.tryParse(json["volume"]) ?? 0,
        risk: int.tryParse(json["risk"]) ?? 0,
        sensor: SensorDto.fromJson(json["sensor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "siloName": siloName,
        "height": height,
        "volume": volume,
        "risk": risk,
        "sensor": sensor.toJson(),
      };
}

class SensorDto {
  int id;

  SensorDto({
    required this.id,
  });

  factory SensorDto.fromJson(Map<String, dynamic> json) => SensorDto(
        id: int.tryParse(json["id"]) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
