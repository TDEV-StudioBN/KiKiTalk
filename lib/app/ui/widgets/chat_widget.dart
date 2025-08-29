import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';

class WIDChatBubble extends StatelessWidget {
  final bool isMe;
  final Color color;
  final Widget child;

  const WIDChatBubble({
    super.key,
    required this.child,
    this.isMe = false,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubblePainter(
          color: color,
          background: context.style.color.cardColor,
          isRight: isMe,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: child
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  final Color color;
  final Color background;
  final bool isRight;
  _BubblePainter({
    required this.color,
    required this.background,
    required this.isRight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    /// Mũi tên hướng ----------------------
    double startY = size.height / 3;
    if (isRight) {
      path.moveTo(size.width - 12, startY);
      path.lineTo(size.width - 6, startY - 6);
      path.lineTo(size.width + 4, startY + 6);
    } else {
      path.moveTo(12, startY);
      path.lineTo(-4, startY + 6);
      path.lineTo(6, startY - 6);
    }
    path.close();

    /// Hình bao quanh toàn kích thước  --------------------
    final pathRect = Path();
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(16),
    );
    pathRect.addRRect(rrect);

    final colorPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final backgroundPaint = Paint()
      ..color = background
      ..style = PaintingStyle.fill;
    final borderRectPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final borderArrow = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, borderArrow);
    canvas.drawPath(pathRect, backgroundPaint);
    canvas.drawPath(pathRect, colorPaint);
    canvas.drawPath(pathRect, borderRectPaint);
    canvas.drawPath(path, backgroundPaint);
    canvas.drawPath(path, colorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}