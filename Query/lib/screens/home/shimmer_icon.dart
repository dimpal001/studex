import 'package:flutter/material.dart';
import 'dart:math';

class ShimmerIcon extends StatefulWidget {
  @override
  _ShimmerIconState createState() => _ShimmerIconState();
}

class _ShimmerIconState extends State<ShimmerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: pi * 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white.withAlpha(100),
                    Theme.of(context).colorScheme.secondary,
                    Colors.white.withAlpha(100),
                  ],
                  stops: [
                    (_animation.value / pi),
                    (_animation.value / pi) + 0.2,
                    (_animation.value / pi) + 0.4,
                  ],
                ).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: const Icon(
                    Icons.school,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
