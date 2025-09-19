// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_pokeapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonPokeapiModel _$PokemonPokeapiModelFromJson(Map<String, dynamic> json) =>
    PokemonPokeapiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      species: PokemonSpecies.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonPokeapiModelToJson(
        PokemonPokeapiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'types': instance.types,
      'stats': instance.stats,
      'sprites': instance.sprites,
      'species': instance.species,
    };

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      ability: AbilityDetail.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

AbilityDetail _$AbilityDetailFromJson(Map<String, dynamic> json) =>
    AbilityDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityDetailToJson(AbilityDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      slot: (json['slot'] as num).toInt(),
      type: TypeDetail.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

TypeDetail _$TypeDetailFromJson(Map<String, dynamic> json) => TypeDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TypeDetailToJson(TypeDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: StatDetail.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

StatDetail _$StatDetailFromJson(Map<String, dynamic> json) => StatDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StatDetailToJson(StatDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      frontDefault: json['front_default'] as String?,
      others: json['others'] == null
          ? null
          : PokemonOtherSprites.fromJson(
              json['others'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'others': instance.others,
    };

PokemonOtherSprites _$PokemonOtherSpritesFromJson(Map<String, dynamic> json) =>
    PokemonOtherSprites(
      dreamWorld: json['dream_world'] == null
          ? null
          : DreamWorldSprites.fromJson(
              json['dream_world'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonOtherSpritesToJson(
        PokemonOtherSprites instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld,
    };

DreamWorldSprites _$DreamWorldSpritesFromJson(Map<String, dynamic> json) =>
    DreamWorldSprites(
      frontDefault: json['from_default'] as String?,
    );

Map<String, dynamic> _$DreamWorldSpritesToJson(DreamWorldSprites instance) =>
    <String, dynamic>{
      'from_default': instance.frontDefault,
    };

PokemonSpecies _$PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    PokemonSpecies(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonSpeciesToJson(PokemonSpecies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
