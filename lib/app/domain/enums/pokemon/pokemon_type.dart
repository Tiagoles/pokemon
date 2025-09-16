import 'package:flutter/material.dart';

enum PokemonType {
  normal(
    'Normal',
    'Balance and simplicity.',
    Color(0xFF90A4AE), // Blue Grey 300
  ),
  fighting(
    'Fighting',
    'Physical power and combat skills.',
    Color(0xFF6D4C41), // Brown 700
  ),
  flying(
    'Flying',
    'Airborne speed and agility.',
    Color(0xFF546E7A), // Blue Grey 600
  ),
  poison(
    'Poison',
    'Toxic abilities and status effects.',
    Color(0xFF7B1FA2), // Purple 700
  ),
  ground(
    'Ground',
    'Earth-based strength and defense.',
    Color(0xFF8D6E63), // Brown 400
  ),
  rock(
    'Rock',
    'Solid endurance and power.',
    Color(0xFF6D4C41), // Brown 700
  ),
  bug(
    'Bug',
    'Small but fast and persistent.',
    Color(0xFF689F38), // Light Green 700
  ),
  ghost(
    'Ghost',
    'Ethereal and mysterious.',
    Color(0xFF4527A0), // Deep Purple 700
  ),
  steel(
    'Steel',
    'Durable and metallic resilience.',
    Color(0xFF607D8B), // Blue Grey 500
  ),
  fire(
    'Fire',
    'Burning energy and attack power.',
    Color(0xFFD84315), // Deep Orange 800
  ),
  water(
    'Water',
    'Fluidity and adaptability.',
    Color(0xFF0277BD), // Blue 800
  ),
  grass(
    'Grass',
    'Nature’s vitality and growth.',
    Color(0xFF2E7D32), // Green 800
  ),
  electric(
    'Electric',
    'High voltage speed and impact.',
    Color(0xFFF9A825), // Yellow 800
  ),
  psychic(
    'Psychic',
    'Mental prowess and intuition.',
    Color(0xFFAD1457), // Pink 800
  ),
  ice(
    'Ice',
    'Chilling defense and control.',
    Color(0xFF00ACC1), // Cyan 700
  ),
  dragon(
    'Dragon',
    'Legendary strength and ferocity.',
    Color(0xFF512DA8), // Deep Purple 700
  ),
  dark(
    'Dark',
    'Stealth and cunning tactics.',
    Color(0xFF37474F), // Blue Grey 800
  ),
  fairy(
    'Fairy',
    'Charm and magical power.',
    Color(0xFFAD1457), // Pink 800
  ),
  stellar(
    'Stellar',
    'Celestial energy and uniqueness.',
    Color(0xFF00695C), // Teal 800
  ),
  unknown(
    'Unknown',
    'Unclassified or mysterious.',
    Color(0xFF616161), // Grey 700
  );

  const PokemonType(this.displayName, this.description, this.color);

  final String displayName;
  final String description;
  final Color color;
}
