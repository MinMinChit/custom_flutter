library custom_ui;

import 'package:flutter/material.dart';

class GradientLinearProgressIndicator extends StatelessWidget {
  final double progress;
  final double height;
  final double? width;
  final List<Color>? colors;

  const GradientLinearProgressIndicator({
    Key? key,
    required this.progress,
    this.height = 20,
    this.width,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: height,
              width: width ?? MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFEBEBEB),
                  ],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(seconds: 4),
              builder: (BuildContext context, double value, Widget? child) {
                return LayoutBuilder(
                  builder:
                      (BuildContext context, BoxConstraints boxConstraints) {
                    return Container(
                      width: value * boxConstraints.maxWidth,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          colors: colors ?? [Colors.black, Colors.white],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
