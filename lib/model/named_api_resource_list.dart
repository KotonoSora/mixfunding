import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'named_api_resource_list.g.dart';

@JsonSerializable()
class NamedAPIResourceList {
  NamedAPIResourceList(this.count, this.next, this.previous, this.results);

  int count;
  String? next;
  String? previous;
  List<NamedAPIResource> results;

  factory NamedAPIResourceList.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceListFromJson(json);

  Map<String, dynamic> toJson() => _$NamedAPIResourceListToJson(this);
}
