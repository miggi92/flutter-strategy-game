import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:mogamgm12/unit.dart';

class Mage extends Unit {
  Mage({
    required Vector2? position,
    required Game gameRef,
  }) : super(
          name: 'Mage',
          health: 100,
          attack: 20,
          defense: 15,
          movementRange: 3,
          sprite: Sprite(gameRef.images.fromCache('game/units/mage.jpg')),
          size: Vector2(50, 50),
          position: position,
        );
}
