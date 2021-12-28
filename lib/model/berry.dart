import 'package:json_annotation/json_annotation.dart';

part 'berry.g.dart';

@JsonSerializable()
class Berry {
  Berry(this.name, this.url);

  String name;
  String url;

  factory Berry.fromJson(Map<String, dynamic> json) => _$BerryFromJson(json);

  Map<String, dynamic> toJson() => _$BerryToJson(this);
}
