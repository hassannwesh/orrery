import 'dart:math';


import 'package:flutter/material.dart';

class SolarSystemScreen extends StatefulWidget {
  const SolarSystemScreen({super.key});

  @override
  _SolarSystemScreenState createState() => _SolarSystemScreenState();
}

class _SolarSystemScreenState extends State<SolarSystemScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationOffset = 0.0;
  double _scaleFactor = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _rotationOffset += details.primaryDelta! * 0.01;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scaleFactor = details.scale.clamp(0.5, 2.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onScaleUpdate: _onScaleUpdate,
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleFactor,
                child: CustomPaint(
                  painter: SolarSystemPainter(_controller.value + _rotationOffset),
                  child: Container(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SolarSystemPainter extends CustomPainter {
  final double rotationOffset;
  final List<String> planetImages = [
    'assets/mercury_info.png',
    'assets/venu.png',
    'assets/earth.png',
    'assets/mars.png',
    'assets/Jup.png',
    'assets/satu.png',
    'assets/uran.png',
    'assets/nep.png',
  ];
  final List<String> planetNames = [
    'Mercury',
    'Venus',
    'Earth',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
  ];

  SolarSystemPainter(this.rotationOffset);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint orbitPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke;

    final List<double> radii = [100, 140, 180, 220, 260, 300, 340, 380];

    // رسم المدارات
    for (double radius in radii) {
      canvas.drawCircle(center, radius, orbitPaint);
    }

    final paint = Paint();

    // رسم الشمس في المنتصف كصورة
    final sunImage = const AssetImage('assets/sun.png');
    const sunSize = 170.0; // حجم الشمس
    final sunRect = Rect.fromCenter(
      center: center,
      width: sunSize,
      height: sunSize,
    );

    sunImage.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        canvas.drawImageRect(
          info.image,
          Rect.fromLTWH(0, 0, info.image.width.toDouble(),
              info.image.height.toDouble()),
          sunRect,
          paint,
        );
      }),
    );

    // رسم الكواكب وصورهم وأسمائهم
    for (int i = 0; i < radii.length; i++) {
      double angle = 2 * pi * (rotationOffset + i * 0.1);
      double x = center.dx + radii[i] * cos(angle);
      double y = center.dy + radii[i] * sin(angle);

      // رسم صورة الكوكب
      final planetImage = planetImages[i];
      const imageSize = 40.0;
      final planetRect = Rect.fromCenter(
        center: Offset(x, y),
        width: imageSize,
        height: imageSize,
      );
      final planetImageAsset = AssetImage(planetImage);
      planetImageAsset.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo info, bool _) {
          canvas.drawImageRect(
            info.image,
            Rect.fromLTWH(0, 0, info.image.width.toDouble(),
                info.image.height.toDouble()),
            planetRect,
            paint,
          );
        }),
      );

      // رسم اسم الكوكب
      TextSpan span = TextSpan(
        style: const TextStyle(color: Colors.white, fontSize: 12),
        text: planetNames[i],
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
          canvas,
          Offset(x - tp.width / 2,
              y + imageSize / 2 + 5)); // عرض الاسم أسفل الكوكب بقدر معين
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}