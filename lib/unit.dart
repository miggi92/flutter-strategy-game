import 'package:flame/components.dart';

class Unit extends SpriteComponent {
  String name;
  int health;
  int attack;
  int defense;
  int movementRange;

  Unit({
    required this.name,
    required this.health,
    required this.attack,
    required this.defense,
    required this.movementRange,
    required super.sprite,
    required super.size,
    required super.position,
  });
}
