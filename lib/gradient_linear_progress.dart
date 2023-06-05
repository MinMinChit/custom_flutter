library custom_ui;

import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double progress;
  final double? height;
  final double? width;
  final BoxDecoration? backDecoration;
  final BoxDecoration? decoration;
  final Duration? animatedDuration;

  const CustomLinearProgressIndicator({
    Key? key,
    required this.progress,
    this.height = 8,
    this.width,
    this.backDecoration,
    this.decoration,
    this.animatedDuration,
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
              decoration: backDecoration ??
                  BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.grey,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
            ),
            TweenAnimationBuilder(
              curve: Curves.linear,
              tween: Tween<double>(begin: 0, end: progress),
              duration: animatedDuration ?? const Duration(seconds: 0),
              builder: (BuildContext context, double value, Widget? child) {
                return LayoutBuilder(
                  builder:
                      (BuildContext context, BoxConstraints boxConstraints) {
                    return Container(
                      width: value * boxConstraints.maxWidth,
                      height: height,
                      decoration: decoration ??
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.black,
                              ],
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
