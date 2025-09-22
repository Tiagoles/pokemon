import 'package:flutter/cupertino.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

enum PokemonType {
  normal(Color(0xffA8A77A), "Normal"),
  fighting(Color(0xffC22E28), "Fighting"),
  flying(Color(0xffA98FF3), "Flying"),
  poison(Color(0xffA33EA1), "Poison"),
  ground(Color(0xffE2BF65), "Ground"),
  rock(Color(0xffB6A136), "Rock"),
  bug(Color(0xffA6B91A), "Bug"),
  ghost(Color(0xff735797), "Ghost"),
  steel(Color(0xffB7B7CE), "Steel"),
  fire(Color(0xffEE8130), "Fire"),
  water(Color(0xff6390F0), "Water"),
  grass(Color(0xff7AC74C), "Grass"),
  electric(Color(0xffF7D02C), "Electric"),
  psychic(Color(0xffF95587), "Psychic"),
  ice(Color(0xff96D9D6), "Ice"),
  dragon(Color(0xff6F35FC), "Dragon"),
  dark(Color(0xff705746), "Dark"),
  fairy(Color(0xffD685AD), "Fairy"),
  stellar(Color(0xffFFD700), "Stellar"),
  unknown(Color(0xff68A090), "Unknown");

  final Color color;
  final String desc;

  const PokemonType(this.color, this.desc);

  static PokemonType getType(String type) {
    return PokemonType.values.firstWhere(
      (t) => t.name == type,
      orElse: () => PokemonType.unknown,
    );
  }
}
