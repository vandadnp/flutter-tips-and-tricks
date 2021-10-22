//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const textColor = Color.fromRGBO(156, 156, 247, 1);

class BoxPainter extends CustomPainter {
  final bool isBlinking;
  BoxPainter({required this.isBlinking});

  @override
  void paint(Canvas canvas, Size size) {
    if (isBlinking) {
      final rect = Rect.fromLTWH(
        size.width / 20.0,
        size.height / 2.8,
        size.width / 24.0,
        size.height / 13.0,
      );
      final paint = Paint()..color = textColor;
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ReadyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: textColor,
      fontSize: size.width / 45.0,
      fontFamily: 'C64',
    );
    final span = TextSpan(
      text: 'READY',
      style: textStyle,
    );
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );

    painter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(
      painter.width / 2.0,
      painter.height * 8.0,
    );
    painter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SubTitlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: textColor,
      fontSize: size.width / 45.0,
      fontFamily: 'C64',
    );
    final span = TextSpan(
      text: '64K RAM SYSTEM 38911 BASIC BYTES FREE',
      style: textStyle,
    );
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );

    painter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(
      size.width - painter.width - (size.width / 11),
      painter.height * 6.0,
    );
    painter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TitlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: textColor,
      fontSize: size.width / 40.0,
      fontFamily: 'C64',
    );
    final span = TextSpan(
      text: '**** COMMODORE 64 BASIC V2 ****',
      style: textStyle,
    );
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );

    painter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(
      size.width - painter.width - (size.width / 9),
      size.height / 6,
    );
    painter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final border = size.width / 20.0;

    final color = Color.fromRGBO(
      58,
      57,
      213,
      1,
    );

    final paint = Paint()..color = color;

    final rect = Rect.fromLTWH(
      border,
      border,
      size.width - (border * 2.0),
      size.height - (border * 2.0),
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = textColor;
    final rect = Rect.fromLTWH(
      0.0,
      0.0,
      size.width,
      size.height,
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Commodore64Painter extends CustomPainter {
  final bool isBlinking;

  late final List<CustomPainter> painters;

  Commodore64Painter({required this.isBlinking}) {
    painters = [
      BorderPainter(),
      BackgroundPainter(),
      TitlePainter(),
      SubTitlePainter(),
      ReadyPainter(),
      BoxPainter(isBlinking: isBlinking)
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    painters.forEach(
      (p) => p.paint(
        canvas,
        size,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => painters
      .map((p) => p.shouldRepaint(oldDelegate))
      .reduce((p1, p2) => p1 || p2);
}

class Commodore64 extends StatefulWidget {
  const Commodore64({Key? key}) : super(key: key);

  @override
  State<Commodore64> createState() => _Commodore64State();
}

class _Commodore64State extends State<Commodore64> {
  bool _isBlinking = false;

  final timer = Stream.periodic(Duration(seconds: 1), (value) => value);

  void _triggerRedraw() async {
    await for (final _ in timer) {
      setState(() {
        _isBlinking = !_isBlinking;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _triggerRedraw();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxWidth / (16.0 / 9.0),
        child: CustomPaint(
          painter: Commodore64Painter(isBlinking: _isBlinking),
        ),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Commodore64(),
      ),
    );
  }
}
