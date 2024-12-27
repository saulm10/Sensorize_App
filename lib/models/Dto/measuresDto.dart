import 'dart:convert';

List<MeasuresDto> measuresDtoFromJson(String str) => List<MeasuresDto>.from(
    json.decode(str).map((x) => MeasuresDto.fromJson(x)));

String measuresDtoToJson(List<MeasuresDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeasuresDto {
  int id;
  int siloId;
  double result;
  DateTime date;
  bool fullFilled;

  MeasuresDto({
    required this.id,
    required this.siloId,
    required this.result,
    required this.date,
    required this.fullFilled,
  });

  factory MeasuresDto.fromJson(Map<String, dynamic> json) => MeasuresDto(
        id: int.tryParse(json["id"]) ?? 0,
        siloId: int.tryParse(json["siloId"]) ?? 0,
        result: double.tryParse(json["result"]) ?? 0,
        date: DateTime.parse(json["date"]),
        fullFilled: json["fullFilled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "siloId": siloId,
        "result": result,
        "date": date.toIso8601String(),
        "fullFilled": fullFilled,
      };
}
