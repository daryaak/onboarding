import 'package:flutter/material.dart';
import 'dart:math';

class NextButton extends StatelessWidget{

  final int index;
  final Color color;
  final Function()? onButtonTapped;

  NextButton({required this.index, required this.onButtonTapped, required this.color});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTapped,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(58, 58),
            painter: CustomPainterButton(index: index, color: color),
          ),
        ],
      ),
    );
  }
}

class CustomPainterButton extends CustomPainter{

  int index;
  Color color;

  CustomPainterButton({required this.index, required this.color});

  @override
  void paint(Canvas canvas, Size size){
    final strokeWidth = size.width/15;
    final circleCenter = Offset(size.width / 2, size.height / 2);
    final circleRadius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5)
      ..blendMode = BlendMode.srcOver
      ..strokeWidth = strokeWidth 
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(circleCenter, circleRadius, paint);

    final arcPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Rect.fromCircle(center: circleCenter, radius: circleRadius),
        -pi / 2, 2 * pi * 0.25*(index+1), false, arcPaint);

    final insideCircle = Paint()
      ..color = Colors.white
      ..blendMode = BlendMode.srcOver
      ..style = PaintingStyle.fill;

    canvas.drawCircle(circleCenter, 21, insideCircle);
    
    final textPainter = TextPainter(
      text: TextSpan(
        text: '>',
        style: TextStyle(
          color: color,
          fontSize: 27,
          fontWeight: FontWeight.w300,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textOffset = Offset(
      size.width * 0.5 - textPainter.width / 2,
      size.height * 0.5 - textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}