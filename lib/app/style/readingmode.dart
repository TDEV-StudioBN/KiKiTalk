import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Painter vẽ ra 1 lớp noise nhỏ
class _NoisePainter extends CustomPainter {
  final Random _random = Random();
  final int noiseDensity;
  final Color? noiseColor;

  _NoisePainter({
    required this.noiseDensity,
    this.noiseColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final color = Colors.grey.withValues(alpha: 0.5);
    for (int i = 0; i < noiseDensity; i++) {
      final x = _random.nextDouble() * size.width;
      final y = _random.nextDouble() * size.height;

      final paint = Paint()
        ..color = color;

      canvas.drawRect(Rect.fromLTWH(x, y, 0.25, 0.25), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Class chính: nền vàng + nhám
class ReadingPaperBackground extends StatefulWidget {
  final Widget child;

  const ReadingPaperBackground({super.key, required this.child});

  @override
  State<ReadingPaperBackground> createState() => _ReadingPaperBackgroundState();
}

class _ReadingPaperBackgroundState extends State<ReadingPaperBackground> {
  ui.Image? _texture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_texture == null) {
      _generateTexture();
    }
  }

  Future<void> _generateTexture() async {
    const tileSize = Size(250, 250);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // nền vàng nhạt
    final basePaint = Paint()..color = const Color(0xFFFDF6E3).withValues(alpha: 0.3);
    // canvas.drawRect(Offset.zero & tileSize, basePaint);

    final painter = _NoisePainter(
      noiseDensity: 2500,
      noiseColor: Colors.transparent,
    );
    for (int i = 0; i < 25; i++) {
      painter.paint(canvas, tileSize);
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(tileSize.width.toInt(), tileSize.height.toInt());

    setState(() {
      _texture = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_texture != null)
          Positioned.fill(child: CustomPaint(painter: _TilePainter(_texture!))),
        widget.child,
      ],
    );
  }
}

/// Painter lặp lại 1 tile noise ra toàn màn hình
class _TilePainter extends CustomPainter {
  final ui.Image texture;

  _TilePainter(this.texture);

  @override
  void paint(Canvas canvas, Size size) {
    const tileSize = 200.0;
    final paint = Paint();

    for (double dx = 0; dx < size.width; dx += tileSize) {
      for (double dy = 0; dy < size.height; dy += tileSize) {
        canvas.drawImageRect(
          texture,
          Rect.fromLTWH(0, 0, texture.width.toDouble(), texture.height.toDouble()),
          Rect.fromLTWH(dx, dy, tileSize, tileSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
