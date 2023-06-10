library custom_ui;

import 'package:flutter/material.dart';

class CustomShaderMask extends StatelessWidget {
  const CustomShaderMask({
    Key? key,
    this.child,
    this.gradient,
  }) : super(key: key);

  final Widget? child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => gradient == null
          ? const LinearGradient(
              colors: [
                Colors.red,
                Colors.blue,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds)
          : gradient!.createShader(bounds),
      child: child,
    );
  }
}
