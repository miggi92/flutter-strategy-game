import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameBoard extends Component with HasGameRef<MyGame> {
  @override
  void render(Canvas canvas) {
    final fieldSize = Vector2(50, 50); // Größe eines Feldes
    final fieldColor = Colors.green; // Farbe des Feldes
    final borderColor = Colors.black; // Farbe des Rands

    for (var x = 0; x < 10; x++) {
      // 10 Felder in der Breite
      for (var y = 0; y < 10; y++) {
        // 10 Felder in der Höhe
        final position = Vector2(x * fieldSize.x, y * fieldSize.y);
        final rect = Rect.fromLTWH(
          position.x,
          position.y,
          fieldSize.x,
          fieldSize.y,
        );

        canvas.drawRect(rect, Paint()..color = fieldColor);
        canvas.drawRect(
            rect,
            Paint()
              ..color = borderColor
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2);
      }
    }
  }

  @override
  void update(double dt) {
    // Hier können wir später den Spielzustand aktualisieren
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(GameBoard());
  }
}
