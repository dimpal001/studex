import 'package:flutter/material.dart';

class ChapterCard extends StatelessWidget {
  final Map<String, dynamic> chapter;
  final int index;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onMove;
  final VoidCallback? onEdit;

  const ChapterCard({
    Key? key,
    required this.chapter,
    required this.index,
    this.onTap,
    this.onDelete,
    this.onMove,
    this.onEdit,
  }) : super(key: key);

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures a smooth modal experience
      backgroundColor:
          Colors.transparent, // Transparent background for custom styling
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required Color color,
      VoidCallback? onTap}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        if (onTap != null) onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showOptionsMenu(context),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              "${index + 1}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            chapter['name'] ?? 'Unnamed Chapter',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            "${chapter['questions'] ?? 0} Questions",
            style: const TextStyle(color: Colors.white70),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
          onTap: onTap,
        ),
      ),
    );
  }
}
