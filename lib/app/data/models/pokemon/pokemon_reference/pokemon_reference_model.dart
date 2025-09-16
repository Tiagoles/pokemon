import 'package:json_annotation/json_annotation.dart';

part 'pokemon_reference_model.g.dart';

@JsonSerializable()
class PokemonReferenceModel{
  final String name;
  final String url;

  PokemonReferenceModel({
    required this.name,
    required this.url
  });

  factory PokemonReferenceModel.fromJson(Map<String, dynamic> json) => _$PokemonReferenceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonReferenceModelToJson(this);

}