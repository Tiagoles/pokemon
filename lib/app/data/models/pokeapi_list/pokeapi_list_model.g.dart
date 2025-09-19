// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeApiListModel _$PokeApiListModelFromJson(Map<String, dynamic> json) =>
    PokeApiListModel(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map(
              (e) => PokeApiListResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PokeApiListResultModel _$PokeApiListResultModelFromJson(
        Map<String, dynamic> json) =>
    PokeApiListResultModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
