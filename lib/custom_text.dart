// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyCustomText extends StatefulWidget {
  const MyCustomText({super.key});

  @override
  _MyCustomTextState createState() => _MyCustomTextState();
}

class _MyCustomTextState extends State<MyCustomText> {
  double _hoverPosition = 0;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _hoverPosition = event.localPosition.dx;
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: 0, end: _isHovering ? _hoverPosition : 0),
              duration: const Duration(milliseconds: 150),
              builder: (context, value, child) {
                final gradient = LinearGradient(
                  colors: const [
                    Color(0xff187BCD),
                    Color(0xff03254C),
                    Color(0xff187BCD)
                  ],
                  stops: [
                    (value - 50) / constraints.maxWidth,
                    value / constraints.maxWidth,
                    (value + 50) / constraints.maxWidth,
                  ],
                );
                final shader = gradient.createShader(
                  Rect.fromLTWH(
                      0, 0, constraints.maxWidth, constraints.maxHeight),
                );
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'FlutterBytes',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.fontSize,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'GigaSans',
                              wordSpacing: -15,
                              foreground: () {
                                if (_isHovering) {
                                  return Paint()..shader = shader;
                                } else {
                                  return Paint()
                                    ..color = const Color(0xff187BCD);
                                }
                              }()),
                        ),
                      ),
                      Text(
                        "Community",
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'GigaSans',
                                ),
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
