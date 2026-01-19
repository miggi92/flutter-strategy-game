import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Unit extends SpriteComponent with TapCallbacks {
  String name;
  int health;
  int attack;
  int defense;
  int movementRange;

  Function(Unit)? onTapCallback;

  Unit({
    required this.name,
    required this.health,
    required this.attack,
    required this.defense,
    required this.movementRange,
    required super.sprite,
    required super.size,
    required super.position,
    this.onTapCallback,
  });

  @override
  void onTapUp(TapUpEvent event) {
    onTapCallback?.call(this);
    event.continuePropagation = false;
  }
}
