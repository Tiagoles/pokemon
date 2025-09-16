import 'package:json_annotation/json_annotation.dart';
import '../pokemon_reference/pokemon_reference_model.dart';

part 'pokeapi_list_result_model.g.dart';

@JsonSerializable()
class PokeapiListResultModel{
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonReferenceModel> results;

  PokeapiListResultModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results
  });

  factory PokeapiListResultModel.fromJson(Map<String, dynamic> json) => _$PokeapiListResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokeapiListResultModelToJson(this);

}