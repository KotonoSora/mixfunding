import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprites.g.dart';

@JsonSerializable()
class PokemonSprites {
  PokemonSprites(
    this.front_default,
    this.front_shiny,
    this.front_female,
    this.front_shiny_female,
    this.back_default,
    this.back_shiny,
    this.back_female,
    this.back_shiny_female,
  );

  String? front_default;
  String? front_shiny;
  String? front_female;
  String? front_shiny_female;
  String? back_default;
  String? back_shiny;
  String? back_female;
  String? back_shiny_female;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}
