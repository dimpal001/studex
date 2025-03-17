import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/custom_bar.dart';
import 'package:my_flutter_app/constants/custom_snackbar.dart';
import 'package:my_flutter_app/constants/user_card.dart';
import 'package:my_flutter_app/screens/questions/question_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> updateQuestionChapter(
    String questionId, String newChapterId) async {
  final url = Uri.parse('$baseUrl/question/move-to-another-chapter');
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': questionId,
        'chapterId': newChapterId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update chapter: ${response.statusCode}');
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> shareQuestionWithUser(String questionId, List userIds) async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  final url = Uri.parse('$baseUrl/questions/$questionId/share');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'userIds': userIds}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to share question: ${response.statusCode}');
    }
  } catch (e) {
    rethrow;
  }
}

class QuestionCard extends StatefulWidget {
  final Map<String, dynamic> question;
  final List<dynamic> chapters;
  final int index;
  final VoidCallback? onDelete;
  final VoidCallback? onMove;
  final VoidCallback? onEdit;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.chapters,
    required this.index,
    this.onDelete,
    this.onMove,
    this.onEdit,
  }) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List<dynamic> friends = [];
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;
  bool isUpdating = false;
  bool isSharing = false;
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();
    fetchFriends();
  }

  Future<void> fetchFriends() async {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    final url =
        Uri.parse('$baseUrl/friend/friend-list?userId=$userId&page=$page');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          friends.addAll(data['friends']);
          page++;
          hasMore = data['friends'].length > 0;
        });
      }
    } catch (e) {}

    setState(() => isLoading = false);
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildOptionsSheet(context),
    );
  }

  Widget _buildOptionsSheet(BuildContext context) {
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
            icon: Icons.drive_file_move,
            title: "Move to Another Chapter",
            color: Colors.orange,
            onTap: () => _showMoveToChapterSheet(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.share,
            title: "Share with a Friend",
            color: Colors.green,
            onTap: () => _showShareWithUsersSheet(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.delete,
            title: "Delete Question",
            color: Colors.red,
            onTap: () => _showDeleteConfirmation(context),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showMoveToChapterSheet(BuildContext context) {
    Navigator.pop(context);
    String? selectedChapterId = widget.question['chapter']['id'];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomBar(),
              Text(
                'Move to Chapter',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedChapterId,
                decoration: const InputDecoration(
                  labelText: 'Select Chapter',
                  border: OutlineInputBorder(),
                ),
                items: widget.chapters.map((chapter) {
                  return DropdownMenuItem<String>(
                    value: chapter['id'],
                    child: Text(chapter['name']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedChapterId = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: selectedChapterId == null ||
                        selectedChapterId == widget.question['chapterId']
                    ? null
                    : () async {
                        setState(() => isUpdating = true);
                        try {
                          await updateQuestionChapter(
                              widget.question['id'], selectedChapterId!);
                          if (widget.onMove != null) widget.onMove!();
                          Navigator.pop(context);
                          CustomSnackbar.show(context,
                              message: "Chapter has been updated.",
                              variant: SnackbarVariant.success);
                        } catch (e) {
                          CustomSnackbar.show(context,
                              message: "Failed to change chapter.",
                              variant: SnackbarVariant.error);
                        } finally {
                          setState(() => isUpdating = false);
                        }
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: isUpdating
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Update',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showShareWithUsersSheet(BuildContext context) {
    Navigator.pop(context);
    List<String> selectedUserIds = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const CustomBar(),
              Text('Share with Users',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Expanded(
                  child: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  final user = friends[index];
                  return UserCard(
                    userId: user["id"],
                    fullName: user["follower"]["fullName"],
                    profileUrl: user["follower"]["profileUrl"] ?? '',
                    className: user["follower"]["class"]["name"] ?? '',
                    isSelected: selectedUserIds.contains(user['id']),
                    onTap: () {
                      setState(() {
                        if (selectedUserIds.contains(user['id'])) {
                          selectedUserIds.remove(user['id']);
                        } else {
                          selectedUserIds.add(user['id']);
                        }
                      });
                    },
                  );
                },
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: selectedUserIds.isEmpty
                      ? null
                      : () async {
                          setState(() => isSharing = true);
                          try {
                            await shareQuestionWithUser(
                                widget.question['id'], selectedUserIds);
                            Navigator.pop(context);
                            CustomSnackbar.show(context,
                                message: "Question shared successfully",
                                variant: SnackbarVariant.success);
                          } catch (e) {
                            CustomSnackbar.show(context,
                                message: "Failed to share question",
                                variant: SnackbarVariant.error);
                          } finally {
                            setState(() => isSharing = false);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: !isSharing
                      ? const SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20.0,
                        )
                      : const Text('Share',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this question?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (widget.onDelete != null) widget.onDelete!();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: isDeleting
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Share', style: TextStyle(color: Colors.white)),
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
      leading: CircleAvatar(
        backgroundColor: color.withAlpha(120),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
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
              "${widget.index + 1}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            widget.question['content'].length > 100
                ? "${widget.question['content'].substring(0, 100)}..."
                : widget.question['content'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    QuestionScreen(questionId: widget.question['id']),
              ),
            );
          },
        ),
      ),
    );
  }
}
