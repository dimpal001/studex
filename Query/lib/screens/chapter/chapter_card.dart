import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/custom_bottom_sheet.dart';

class ChapterCard extends StatelessWidget {
  final Map<String, dynamic> chapter;
  final int index;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onMove;
  final VoidCallback? onEdit;

  const ChapterCard({
    super.key,
    required this.chapter,
    required this.index,
    this.onTap,
    this.onDelete,
    this.onMove,
    this.onEdit,
  });

  void _showOptionsMenu(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMenuItem(
            context,
            icon: Icons.edit,
            title: "Edit Chapter",
            color: Colors.blueAccent,
            onTap: onEdit,
          ),
          _buildMenuItem(
            context,
            icon: Icons.drive_file_move,
            title: "Move to Another Subject",
            color: Colors.orange,
            onTap: onMove,
          ),
          _buildMenuItem(
            context,
            icon: Icons.delete,
            title: "Delete Chapter",
            color: Colors.red,
            onTap: onDelete,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required Color color,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withAlpha(50),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: color),
      ),
      title: Text(title,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.pop(context);
        if (onTap != null) onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onLongPress: () => _showOptionsMenu(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: colorScheme.onPrimary.withAlpha(50), width: 1)),
        color: colorScheme.surface,
        child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            splashColor: colorScheme.primary.withAlpha(50),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter['name'] ?? 'Unnamed Chapter',
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Questions Count
                  Row(
                    children: [
                      Icon(
                        Icons.question_answer,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${chapter['questions'] ?? 0} Questions",
                        style: TextStyle(
                          color: colorScheme.onSurface.withAlpha(180),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        size: 16,
                        color: colorScheme.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${chapter['progress'] ?? '0%'} Completed",
                        style: TextStyle(
                          color: colorScheme.onSurface.withAlpha(150),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
