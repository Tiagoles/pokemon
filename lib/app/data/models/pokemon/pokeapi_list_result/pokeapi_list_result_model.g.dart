// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_list_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeapiListResultModel _$PokeapiListResultModelFromJson(
        Map<String, dynamic> json) =>
    PokeapiListResultModel(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonReferenceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokeapiListResultModelToJson(
        PokeapiListResultModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
