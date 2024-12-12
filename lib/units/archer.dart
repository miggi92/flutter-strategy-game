import 'package:flame/components.dart';
import 'package:flame/game.dart';
import '../unit.dart';

class Archer extends Unit {
  Archer({
    required Vector2? position,
    required Game gameRef,
  }) : super(
          name: 'Archer',
          health: 100,
          attack: 20,
          defense: 15,
          movementRange: 3,
          sprite: Sprite(gameRef.images
              .fromCache('game/units/archer.jpg')), // Load the knight sprite
          size: Vector2(50, 50),
          position: position,
        );
}
