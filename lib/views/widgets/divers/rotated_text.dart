import 'package:flutter/widgets.dart';

class RotatedText extends StatelessWidget {
  final String title;
  final Color color;

  const RotatedText({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 3.0),
      ),
    );
  }
}
