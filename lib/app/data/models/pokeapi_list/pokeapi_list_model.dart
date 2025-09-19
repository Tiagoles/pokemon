import 'package:json_annotation/json_annotation.dart';

part 'pokeapi_list_model.g.dart';
@JsonSerializable(createToJson: false)
class PokeApiListModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokeApiListResultModel> results;

  PokeApiListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokeApiListModel.fromJson(Map<String, dynamic> json) => _$PokeApiListModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class PokeApiListResultModel{
  final String name;
  final String url;

  PokeApiListResultModel({
    required this.name,
    required this.url,
  });

  factory PokeApiListResultModel.fromJson(Map<String, dynamic> json) => _$PokeApiListResultModelFromJson(json);

}