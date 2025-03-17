import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSkeletonLoader(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[600]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(3, (index) {
        double widthFactor = 1.0 - (index * 0.2);
        return Container(
          width: MediaQuery.of(context).size.width * widthFactor,
          height: 16,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    ),
  );
}
