import 'package:json_annotation/json_annotation.dart';

import 'berry.dart';

part 'berries.g.dart';

@JsonSerializable()
class Berries {
  Berries(this.count, this.next, this.previous, this.results);

  int count;
  String? next;
  String? previous;
  List<Berry> results;

  factory Berries.fromJson(Map<String, dynamic> json) =>
      _$BerriesFromJson(json);

  Map<String, dynamic> toJson() => _$BerriesToJson(this);
}
