import 'package:json_annotation/json_annotation.dart';

part 'pokemon_pokeapi_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonPokeapiModel {
  final int id;
  final String name;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  final int height;
  final int weight;
  final List<PokemonAbility> abilities;
  final List<PokemonType> types;
  final List<PokemonStat> stats;
  final PokemonSprites sprites;
  final PokemonSpecies species;

  PokemonPokeapiModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
    required this.stats,
    required this.sprites,
    required this.species,
  });

  factory PokemonPokeapiModel.fromJson(Map<String, dynamic> json) => _$PokemonPokeapiModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonPokeapiModelToJson(this);
}

@JsonSerializable()
class PokemonAbility {
  final AbilityDetail ability;
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;

  PokemonAbility({required this.ability, required this.isHidden, required this.slot});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

@JsonSerializable()
class AbilityDetail {
  final String name;
  final String url;

  AbilityDetail({required this.name, required this.url});

  factory AbilityDetail.fromJson(Map<String, dynamic> json) => _$AbilityDetailFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityDetailToJson(this);
}

@JsonSerializable()
class PokemonType {
  final int slot;
  final TypeDetail type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class TypeDetail {
  final String name;
  final String url;

  TypeDetail({required this.name, required this.url});

  factory TypeDetail.fromJson(Map<String, dynamic> json) => _$TypeDetailFromJson(json);
  Map<String, dynamic> toJson() => _$TypeDetailToJson(this);
}

@JsonSerializable()
class PokemonStat {
  @JsonKey(name: 'base_stat')
  final int baseStat;
  final int effort;
  final StatDetail stat;

  PokemonStat({required this.baseStat, required this.effort, required this.stat});

  factory PokemonStat.fromJson(Map<String, dynamic> json) => _$PokemonStatFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

@JsonSerializable()
class StatDetail {
  final String name;
  final String url;

  StatDetail({required this.name, required this.url});

  factory StatDetail.fromJson(Map<String, dynamic> json) => _$StatDetailFromJson(json);
  Map<String, dynamic> toJson() => _$StatDetailToJson(this);
}

@JsonSerializable()
class PokemonSprites {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  final PokemonOtherSprites? other;

  PokemonSprites({
    this.frontDefault,
    this.other,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}

@JsonSerializable()
class PokemonOtherSprites {
  @JsonKey(name: 'dream_world')
  final DreamWorldSprites? dreamWorld;

  PokemonOtherSprites({this.dreamWorld});

  factory PokemonOtherSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonOtherSpritesToJson(this);
}

@JsonSerializable()
class DreamWorldSprites {
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  DreamWorldSprites({this.frontDefault});

  factory DreamWorldSprites.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldSpritesToJson(this);
}

@JsonSerializable()
class PokemonSpecies {
  final String name;
  final String url;

  PokemonSpecies({required this.name, required this.url});

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => _$PokemonSpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpeciesToJson(this);
}
