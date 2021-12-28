import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'version_game_index.g.dart';

@JsonSerializable()
class VersionGameIndex {
  VersionGameIndex(
    this.game_index,
    this.version,
  );

  int game_index;
  NamedAPIResource version;

  factory VersionGameIndex.fromJson(Map<String, dynamic> json) =>
      _$VersionGameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGameIndexToJson(this);
}
