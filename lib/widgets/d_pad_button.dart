import 'package:flutter/material.dart';

class DPadButton extends StatelessWidget {
  final String direction;
  final VoidCallback onPressed;
  final Color color;

  const DPadButton({
    super.key,
    required this.direction,
    required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(color: color, width: 2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: CustomPaint(
            painter: DPadPainter(
              direction: direction,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class DPadPainter extends CustomPainter {
  final String direction;
  final Color color;

  DPadPainter({
    required this.direction,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    switch (direction) {
      case 'up':
        _drawUpArrow(canvas, center, radius, paint);
        break;
      case 'down':
        _drawDownArrow(canvas, center, radius, paint);
        break;
      case 'left':
        _drawLeftArrow(canvas, center, radius, paint);
        break;
      case 'right':
        _drawRightArrow(canvas, center, radius, paint);
        break;
    }
  }

  void _drawUpArrow(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx - radius * 0.5, center.dy - radius * 0.2)
      ..lineTo(center.dx + radius * 0.5, center.dy - radius * 0.2)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawDownArrow(
      Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()
      ..moveTo(center.dx, center.dy + radius)
      ..lineTo(center.dx - radius * 0.5, center.dy + radius * 0.2)
      ..lineTo(center.dx + radius * 0.5, center.dy + radius * 0.2)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawLeftArrow(
      Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()
      ..moveTo(center.dx - radius, center.dy)
      ..lineTo(center.dx - radius * 0.2, center.dy - radius * 0.5)
      ..lineTo(center.dx - radius * 0.2, center.dy + radius * 0.5)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawRightArrow(
      Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()
      ..moveTo(center.dx + radius, center.dy)
      ..lineTo(center.dx + radius * 0.2, center.dy - radius * 0.5)
      ..lineTo(center.dx + radius * 0.2, center.dy + radius * 0.5)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DPadPainter oldDelegate) {
    return oldDelegate.direction != direction || oldDelegate.color != color;
  }
}
