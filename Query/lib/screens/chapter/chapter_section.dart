import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/custom_bottom_sheet.dart';
import 'package:my_flutter_app/constants/custom_snackbar.dart';
import 'package:my_flutter_app/screens/chapter/chapter_card.dart';
import 'dart:convert';

import 'package:my_flutter_app/screens/query/query_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Subject {
  final String id;
  final String name;

  Subject({required this.id, required this.name});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ChapterSection extends StatefulWidget {
  final String subjectId;

  const ChapterSection({super.key, required this.subjectId});

  @override
  _ChapterSectionState createState() => _ChapterSectionState();
}

class _ChapterSectionState extends State<ChapterSection> {
  List<dynamic> chapters = [];
  List<Subject> subjects = [];
  bool isLoading = true;
  bool hasError = false;

  final TextEditingController _chapterNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchChapters();
    fetchSubjects();
  }

  @override
  void dispose() {
    _chapterNameController.dispose();
    super.dispose();
  }

  Future<void> fetchChapters() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final url = Uri.parse(
          "$baseUrl/chapter/get-chapters?subjectId=${widget.subjectId}&userId=$userId");
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final resData = jsonDecode(response.body);
        setState(() {
          chapters = resData['resData'] ?? [];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load chapters: ${response.statusCode}");
      }
    } catch (error) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  Future<void> fetchSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    try {
      final url = Uri.parse("$baseUrl/user/get-subjects?userId=$userId");
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final resData = jsonDecode(response.body);

        setState(() {
          subjects = (resData['resData'] as List)
              .map((item) => Subject.fromJson(item['subject']))
              .toList();
        });
      } else {
        print('Failed to fetch subjects. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching subjects: $e');
    }
  }

  Future<void> _addChapter(String chapterName) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    final url = Uri.parse("$baseUrl/chapter/add-chapter");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "subjectId": widget.subjectId,
          "userId": userId,
          "name": chapterName,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        if (responseData.containsKey("resData") &&
            responseData["resData"].containsKey("chapter")) {
          setState(() {
            chapters.add(responseData["resData"]["chapter"]);
          });
          return;
        }
        throw Exception("Invalid response format");
      } else {
        throw Exception(
            "Failed to add chapter: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _updateChapter(String chapterId, String newName) async {
    final url = Uri.parse("$baseUrl/chapter/update-chapter");

    try {
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {"id": chapterId, "name": newName, "subjectId": widget.subjectId}),
      );

      if (response.statusCode == 200) {
        setState(() {
          final index = chapters.indexWhere((ch) => ch['id'] == chapterId);
          if (index != -1) {
            chapters[index]['name'] = newName;
          }
        });
      } else {
        throw Exception("Failed to update chapter");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _moveChapter(String chapterId, String newSubjectId) async {
    final url = Uri.parse("$baseUrl/chapter/update-chapter");

    try {
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"id": chapterId, "subjectId": newSubjectId}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final updatedSubjectId =
            responseData['resData']['chapter']['subjectId'];

        if (updatedSubjectId != widget.subjectId) {
          setState(() {
            chapters.removeWhere((ch) => ch['id'] == chapterId);
          });
        }
      } else {
        throw Exception("Failed to move chapter");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _deleteChapter(String chapterId) async {
    final url = Uri.parse("$baseUrl/chapter/delete-chapter?id=$chapterId");

    try {
      final response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          chapters.removeWhere((ch) => ch['id'] == chapterId);
        });
      } else {
        throw Exception("Failed to delete chapter");
      }
    } catch (e) {
      rethrow;
    }
  }

  void _openAddChapterSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      child: StatefulBuilder(
        builder: (context, setModalState) {
          bool isLoading = false;
          String? errorMessage;

          Future<void> submitChapter() async {
            String newChapterName = _chapterNameController.text.trim();

            if (newChapterName.isEmpty) {
              setModalState(
                  () => errorMessage = "Chapter name cannot be empty");
              return;
            }

            setModalState(() {
              isLoading = true;
              errorMessage = null;
            });

            try {
              await _addChapter(newChapterName);
              setModalState(() {
                isLoading = false;
              });
              _chapterNameController.clear();
              Navigator.pop(context);
              CustomSnackbar.show(context,
                  message: "Chapter added successfully",
                  variant: SnackbarVariant.success);
            } catch (e) {
              setModalState(() {
                isLoading = false;
                errorMessage = "Failed to add chapter: ${e.toString()}";
              });
            }
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Chapter",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _chapterNameController,
                decoration: InputDecoration(
                  labelText: "Chapter Name",
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white38),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              if (errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : submitChapter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Add Chapter",
                          style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEditChapterModal(BuildContext context, dynamic chapter) {
    _chapterNameController.text = chapter['name'];

    CustomBottomSheet.show(
      context: context,
      child: StatefulBuilder(
        builder: (context, setModalState) {
          bool isLoading = false;
          String? errorMessage;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Edit Chapter",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _chapterNameController,
                decoration: InputDecoration(
                  labelText: "Chapter Name",
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white38),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setModalState(() => isLoading = true);
                          try {
                            await _updateChapter(
                                chapter['id'], _chapterNameController.text);
                            Navigator.pop(context);
                            CustomSnackbar.show(context,
                                message: "Chapter updated successfully",
                                variant: SnackbarVariant.success);
                          } catch (e) {
                            setModalState(() => errorMessage = e.toString());
                          } finally {
                            setModalState(() => isLoading = false);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showMoveChapterModal(BuildContext context, dynamic chapter) {
    String? selectedSubjectId = widget.subjectId;

    CustomBottomSheet.show(
      context: context,
      child: StatefulBuilder(
        builder: (context, setModalState) {
          bool isLoading = false;
          String? errorMessage;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Move to Subject",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: selectedSubjectId,
                items: subjects
                    .map((subject) => DropdownMenuItem(
                          value: subject.id,
                          child: Text(
                            subject.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setModalState(() => selectedSubjectId = value),
                decoration: InputDecoration(
                  labelText: "Select Subject",
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white38),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                dropdownColor: Theme.of(context).colorScheme.surfaceContainer,
                style: const TextStyle(color: Colors.white),
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setModalState(() => isLoading = true);
                          try {
                            await _moveChapter(
                                chapter['id'], selectedSubjectId!);
                            Navigator.pop(context);
                            CustomSnackbar.show(context,
                                message: "Chapter moved successfully",
                                variant: SnackbarVariant.success);
                          } catch (e) {
                            setModalState(() => errorMessage = e.toString());
                          } finally {
                            setModalState(() => isLoading = false);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showDeleteChapterModal(BuildContext context, dynamic chapter) {
    showDialog(
      context: context,
      builder: (context) {
        bool isLoading = false;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return AlertDialog(
              title: const Text("Confirm Delete"),
              content:
                  Text("Are you sure you want to delete '${chapter['name']}'?"),
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 18),
              contentTextStyle: const TextStyle(color: Colors.white70),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.white70)),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setModalState(() => isLoading = true);
                          try {
                            await _deleteChapter(chapter['id']);
                            Navigator.pop(context);
                            CustomSnackbar.show(context,
                                message: "Chapter deleted successfully",
                                variant: SnackbarVariant.success);
                          } catch (e) {
                            CustomSnackbar.show(context,
                                message: "Failed deleting chapter",
                                variant: SnackbarVariant.error);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: 17,
                          height: 17,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Delete",
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (hasError)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Failed to load chapters.",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: fetchChapters,
                  child: const Text("Retry"),
                ),
              ],
            ),
          )
        else
          Skeletonizer(
            enabled: isLoading,
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 80),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: isLoading ? 4 : chapters.length,
              itemBuilder: (context, index) {
                if (isLoading) {
                  final dummyChapter = {
                    'name': 'Loading...',
                    'questions': 0,
                    'progress': '0%',
                  };
                  return ChapterCard(
                    index: index,
                    chapter: dummyChapter,
                    onTap: () {},
                  );
                }
                return ChapterCard(
                  chapter: chapters[index],
                  index: index,
                  onEdit: () => _showEditChapterModal(context, chapters[index]),
                  onMove: () => _showMoveChapterModal(context, chapters[index]),
                  onDelete: () =>
                      _showDeleteChapterModal(context, chapters[index]),
                );
              },
            ),
          ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QueryScreen(),
                    ),
                  );
                },
                label: Icon(
                  Icons.question_answer,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              FloatingActionButton.extended(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () => _openAddChapterSheet(context),
                label: const Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 5),
                    Text("New Chapter", style: TextStyle(color: Colors.white)),
                  ],
                ),
                elevation: 6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
