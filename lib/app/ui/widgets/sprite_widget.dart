import 'package:flutter/material.dart';

class WIDSpriteAnimation extends StatefulWidget {
  final ImageProvider image;
  final int rows;
  final int cols;
  final double frameSize; // kích thước hiển thị mỗi frame (vuông)
  final Duration frameDuration;

  const WIDSpriteAnimation({
    super.key,
    required this.image,
    this.rows = 6, // 6 hàng
    this.cols = 7, // 7 cột
    this.frameSize = 71,
    this.frameDuration = const Duration(milliseconds: 100),
  });

  @override
  State<WIDSpriteAnimation> createState() => _WIDSpriteAnimationState();
}

class _WIDSpriteAnimationState extends State<WIDSpriteAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final int _frameCount;

  @override
  void initState() {
    super.initState();
    _frameCount = widget.rows * widget.cols;
    _controller = AnimationController(
      vsync: this,
      duration: widget.frameDuration * _frameCount,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // sprite sheet gốc 500x500
    const spriteSheetWidth = 500.0;
    const spriteSheetHeight = 500.0;

    final frameWidth = spriteSheetWidth / widget.cols;
    final frameHeight = spriteSheetHeight / widget.rows;

    return SizedBox(
      width: widget.frameSize,
      height: widget.frameSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final index = (_controller.value * _frameCount).floor();
          final row = index ~/ widget.cols;
          final col = index % widget.cols;

          final left = col * frameWidth;
          final top = row * frameHeight;

          return ClipRect(
            child: SizedBox(
              width: frameWidth,
              height: frameHeight,
              child: FittedBox(
                fit: BoxFit.none,
                alignment: Alignment.topLeft,
                child: Transform.translate(
                  offset: Offset(-left, -top),
                  child: Image(
                    image: widget.image,
                    width: spriteSheetWidth,
                    height: spriteSheetHeight,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
