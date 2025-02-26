import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/constants/encryption.dart';
import 'package:my_flutter_app/screens/query/Question_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  final TextEditingController _questionController = TextEditingController();
  String? _selectedSubject;
  String? _selectedMarks;
  String? _selectedLanguage;
  XFile? _selectedImage;

  bool _isAsking = false;

  final List<String> _subjects = [
    "Computer Science Engineering",
    "Physics",
    "Chemistry",
    "Mathematics",
  ];
  final List<String> _marksOptions = ["2 Marks", "5 Marks", "10 Marks"];
  final List<String> _languageOptions = [
    "English",
    "Hindi",
    "Assamese",
    "Bengali"
  ];
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _showDropdown(
      BuildContext context, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.foreground,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)
            ],
          ),
          child: ListView(
            shrinkWrap: true,
            children: options.map((option) {
              return ListTile(
                title: Text(option,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                trailing: Icon(Icons.check,
                    color: _selectedSubject == option ||
                            _selectedMarks == option ||
                            _selectedLanguage == option
                        ? AppColors.primary
                        : Colors.transparent),
                onTap: () {
                  onSelect(option);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  final List<Map<String, String>> demoData = [];

  Future<void> _askQuestion() async {
    FocusScope.of(context).unfocus();
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getString('userId');
    final String question = _questionController.text.trim();
    final subjectData = _selectedSubject;
    final boardData = prefs.getString('boardId');
    final classData = prefs.getString('classId');
    final marks = _selectedMarks;
    final language = _selectedLanguage;

    if (question.isEmpty ||
        subjectData == null ||
        marks == null ||
        language == null) {
      Alert.show(context, "Please fill all fields", type: SnackbarType.error);
      return;
    }

    setState(() {
      _isAsking = true;
    });

    final url = Uri.parse('$baseUrl/question/ask');
    final encryptedData = Encryption.encryptData({
      "userId": userId,
      "question": question,
      "subjectData": subjectData,
      "boardData": boardData,
      "classData": classData,
      "marks": marks,
      "language": language,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"data": encryptedData}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final decryptedResponse =
            Encryption.decryptData(responseData["resData"]);
        final question = decryptedResponse["question"];
        final answer = decryptedResponse["answer"];

        demoData.insert(0, {
          "question": question,
          "subject": subjectData!,
          "time": "Just now",
          "answer": answer,
        });

        _questionController.clear();
        setState(() {
          _selectedImage = null;
        });
        Alert.show(context, "Question submitted successfully!",
            type: SnackbarType.success);
      } else {
        final errorMessage = responseData["error"] ?? "Unable to fetch data";
        Alert.show(context, errorMessage, type: SnackbarType.error);
      }
    } catch (error) {
      Alert.show(context, "Error connecting to server",
          type: SnackbarType.error);
    } finally {
      setState(() {
        _isAsking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Studex",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.foreground,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white70),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Question history coming soon!")),
              );
            },
            tooltip: 'View History',
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white70),
            onPressed: () {},
            tooltip: 'More Options',
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.foreground.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDropdownButton(
                            "Subject",
                            _selectedSubject,
                            _subjects,
                            (value) =>
                                setState(() => _selectedSubject = value)),
                        _buildDropdownButton(
                            "Marks",
                            _selectedMarks,
                            _marksOptions,
                            (value) => setState(() => _selectedMarks = value)),
                        _buildDropdownButton(
                            "Language",
                            _selectedLanguage ?? "English",
                            _languageOptions,
                            (value) =>
                                setState(() => _selectedLanguage = value)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _questionController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type your question here...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: AppColors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: _questionController.text.isNotEmpty
                            ? IconButton(
                                icon:
                                    const Icon(Icons.clear, color: Colors.grey),
                                onPressed: () => _questionController.clear(),
                              )
                            : null,
                      ),
                      minLines: 3,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildActionButton(Icons.camera_alt_outlined,
                            () => _pickImage(ImageSource.camera), 'Camera'),
                        const SizedBox(width: 12),
                        _buildActionButton(Icons.image_outlined,
                            () => _pickImage(ImageSource.gallery), 'Gallery'),
                        const SizedBox(width: 12),
                        if (_selectedImage != null)
                          GestureDetector(
                            onTap: () => setState(() => _selectedImage = null),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    File(_selectedImage!.path),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close,
                                      size: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        const Spacer(),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _isAsking
                              ? const CupertinoActivityIndicator(
                                  color: AppColors.primary, radius: 12)
                              : ElevatedButton(
                                  onPressed: _askQuestion,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Ask",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward,
                                          color: Colors.white, size: 18),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: [
                      if (demoData.isEmpty)
                        const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.question_answer,
                                  size: 60, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                'No Questions Yet',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      else
                        ...demoData.map((data) {
                          return QuestionCard(
                            question: data["question"]!,
                            subject: data["subject"]!,
                            time: data["time"]!,
                            answer: data["answer"]!,
                          );
                        }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }

  Widget _buildDropdownButton(String label, String? value, List<String> options,
      Function(String) onSelect) {
    return SizedBox(
      width: 103,
      child: GestureDetector(
        onTap: () => _showDropdown(context, options, onSelect),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value ?? label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
      ),
    );
  }
}
