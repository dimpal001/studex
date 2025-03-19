import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  final int itemCount;
  final EdgeInsets padding;
  final Color? baseColor;
  final Color? highlightColor;
  final double borderRadius;
  final bool circle;

  const SkeletonLoader({
    super.key,
    this.itemCount = 5,
    this.padding = const EdgeInsets.all(16),
    this.baseColor,
    this.highlightColor,
    this.borderRadius = 12.0,
    this.circle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor ??
              Theme.of(context).colorScheme.surfaceContainer.withAlpha(255),
          highlightColor: highlightColor ??
              Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: baseColor ??
                  Theme.of(context).colorScheme.surfaceContainer.withAlpha(100),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (circle) ...[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerLine(width: double.infinity, height: 14),
                      SizedBox(height: 10),
                      _buildShimmerLine(width: 150, height: 12),
                      SizedBox(height: 8),
                      _buildShimmerLine(width: 100, height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
