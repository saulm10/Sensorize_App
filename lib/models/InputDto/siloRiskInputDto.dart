import 'dart:convert';

SiloRiskInputDto siloRiskInputDtoFromJson(String str) =>
    SiloRiskInputDto.fromJson(json.decode(str));

String siloRiskInputDtoToJson(SiloRiskInputDto data) =>
    json.encode(data.toJson());

class SiloRiskInputDto {
  int siloId;
  int newRisk;

  SiloRiskInputDto({
    required this.siloId,
    required this.newRisk,
  });

  factory SiloRiskInputDto.fromJson(Map<String, dynamic> json) =>
      SiloRiskInputDto(
        siloId: json["siloId"],
        newRisk: json["newRisk"],
      );

  Map<String, dynamic> toJson() => {
        "siloId": siloId,
        "newRisk": newRisk,
      };
}
