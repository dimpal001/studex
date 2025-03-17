import 'package:flutter/material.dart';

Widget buildDropdownButton(
  BuildContext context,
  String label,
  String? value,
  List<String> options,
  Function(String) onSelect,
  void Function(BuildContext, List<String>, Function(String)) showDropdown,
) {
  return SizedBox(
    width: 103,
    child: GestureDetector(
      onTap: () => showDropdown(context, options, onSelect),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                value ?? label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    ),
  );
}
