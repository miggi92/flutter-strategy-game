import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mogamgm12/tile.dart';
import 'package:mogamgm12/unit.dart';
import 'package:mogamgm12/units/archer.dart';
import 'package:mogamgm12/units/knight.dart';
import 'package:mogamgm12/units/mage.dart';

class GameBoard extends Component with HasGameRef<MyGame> {
  Unit? selectedUnit;

  @override
  Future<void> onLoad() async {
    final fieldSize = Vector2(50, 50);

    for (var x = 0; x < 10; x++) {
      for (var y = 0; y < 10; y++) {
        final position = Vector2(x * fieldSize.x, y * fieldSize.y);
        add(Tile(
          gridX: x,
          gridY: y,
          position: position,
          size: fieldSize,
          onTapCallback: _onTileTapped,
        ));
      }
    }

    final knight = Knight(position: Vector2(50, 50), gameRef: gameRef);
    knight.onTapCallback = _onUnitTapped;
    add(knight);

    final mage = Mage(position: Vector2(150, 50), gameRef: gameRef);
    mage.onTapCallback = _onUnitTapped;
    add(mage);

    final archer = Archer(position: Vector2(250, 50), gameRef: gameRef);
    archer.onTapCallback = _onUnitTapped;
    add(archer);
  }

  void _onUnitTapped(Unit unit) {
    if (selectedUnit != null) {
      selectedUnit!.paint.colorFilter = null;
    }
    selectedUnit = unit;
    selectedUnit!.paint.colorFilter = const ColorFilter.mode(
      Color(0x88FF0000), // Semi-transparent red
      BlendMode.srcATop,
    );
    print('Selected ${unit.name}');
  }

  void _onTileTapped(Tile tile) {
    if (selectedUnit != null) {
      selectedUnit!.position = tile.position;
      selectedUnit!.paint.colorFilter = null;
      print('Moved ${selectedUnit!.name} to ${tile.gridX}, ${tile.gridY}');
      selectedUnit = null;
    } else {
      print('Tapped tile at ${tile.gridX}, ${tile.gridY}');
    }
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'game/units/knight.jpg',
      'game/units/mage.jpg',
      'game/units/archer.jpg',
    ]);

    add(GameBoard());
  }
}
