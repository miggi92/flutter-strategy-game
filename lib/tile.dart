import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Tile extends PositionComponent with TapCallbacks {
  final int gridX;
  final int gridY;
  final Function(Tile) onTapCallback;

  Tile({
    required this.gridX,
    required this.gridY,
    required Vector2 position,
    required Vector2 size,
    required this.onTapCallback,
  }) : super(position: position, size: size);

  @override
  void render(Canvas canvas) {
    // Draw the tile
    canvas.drawRect(
      size.toRect(),
      Paint()..color = Colors.green,
    );
    // Draw the border
    canvas.drawRect(
      size.toRect(),
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTapCallback(this);
  }
}
