import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/custom_bar.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double maxHeight = constraints.maxHeight * 0.7;

            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, right: 20, top: 15, left: 20),
                  child: Column(
                    children: [CustomBar(), child],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
