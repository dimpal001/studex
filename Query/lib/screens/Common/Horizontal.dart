import 'package:flutter/material.dart';

class HorizontalCarousel extends StatelessWidget {
  final List<Widget> items;

  const HorizontalCarousel({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: PageView.builder(
        itemCount: items.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: items[index],
            ),
          );
        },
      ),
    );
  }
}
