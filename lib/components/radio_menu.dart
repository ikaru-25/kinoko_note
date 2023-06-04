import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kinoko_note/pages/dictionary/list_page.dart';
import 'package:kinoko_note/pages/gallery_page.dart';
import 'package:kinoko_note/pages/observe/camera_page.dart';
import 'package:kinoko_note/pages/animation.dart';

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;

  RadialAnimation({Key? key, required this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        super(key: key);

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, {Color? color, IconData? icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child:
            // FloatingActionButton(
            //   child: Icon(icon),
            //   backgroundColor: color,
            //   onPressed: () {
            //     print('テスト!');
            //   },
            //   // elevation: 0
            // )
            GestureDetector(
          child: Center(child: Icon(icon)),
          onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => CameraPage()),
            //     );
          },
        ));
  }

  _buildDot(double angle, {Color? color}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: Icon(Icons.circle, color: color));
  }

  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Stack(alignment: Alignment.center, children: [
            _buildButton(0, color: Colors.pink, icon: Icons.search),
            _buildButton(45, color: Colors.green, icon: Icons.collections),
            _buildButton(90, color: Colors.orange, icon: Icons.menu),
            _buildButton(135, color: Colors.indigo, icon: Icons.settings),
            _buildDot(180, color: Colors.teal[200]),
            _buildDot(225, color: Colors.teal[200]),
            _buildDot(270, color: Colors.teal[200]),
            _buildButton(315, color: Colors.blue, icon: Icons.add_a_photo),
            Transform.scale(
              scale: scale.value -
                  1.5, // subtract the beginning value to run the opposite animation
              child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.timesCircle),
                  onPressed: _close,
                  backgroundColor: Colors.red),
            ),
            Transform.scale(
              scale: scale.value,
              child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.solidDotCircle),
                  onPressed: _open),
            )
          ]);
        });
  }
}
