import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/constants/custom_bottom_sheet.dart';
import 'package:my_flutter_app/constants/custom_snackbar.dart';
import 'package:my_flutter_app/constants/markdown_stylesheet.dart';
import 'package:my_flutter_app/screens/query/action_button.dart';
import 'package:my_flutter_app/screens/query/dropdown_button.dart';
import 'package:my_flutter_app/screens/query/history/history_screen.dart';
import 'package:my_flutter_app/screens/query/question_card.dart';
import 'package:my_flutter_app/screens/query/skeleton_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  final List<Map<String, String>> _questionsList = [];
  final TextEditingController _questionController = TextEditingController();
  String? _selectedSubject;
  String? _selectedMarks;
  String? _selectedLanguage;
  XFile? _selectedImage;
  bool _isError = false;

  bool _isAsking = false;
  String? _currentQuestion;
  String _currentAnswer = '';
  String? _errorMessage;

  List<String> _subjects = [];

  final List<String> _marksOptions = ["2 Marks", "5 Marks", "10 Marks"];
  final List<String> _languageOptions = [
    "English",
    "Hindi",
    "Assamese",
    "Bengali",
  ];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    final String? subjectsData = prefs.getString('subjectsList');

    setState(() {
      if (subjectsData != null) {
        List<dynamic> subjectsJson = jsonDecode(subjectsData);
        _subjects = subjectsJson
            .map<String>((subject) => subject["subject"]['name'].toString())
            .toList();
      } else {
        _subjects = [
          "Computer Science Engineering",
          "Physics",
          "Chemistry",
          "Mathematics",
        ];
      }
    });
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      File imageFile = File(image.path);
      int fileSize = await imageFile.length();
      double fileSizeInMB = fileSize / (1024 * 1024);

      if (fileSizeInMB > 5) {
        Alert.show(
          context,
          "Image size should be less than 2MB",
          type: SnackbarType.error,
        );
        return;
      }

      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _showDropdown(
    BuildContext context,
    List<String> options,
    Function(String) onSelect,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
            ],
          ),
          child: ListView(
            shrinkWrap: true,
            children: options.map((option) {
              return ListTile(
                title: Text(
                  option,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: Icon(
                  Icons.check,
                  color: _selectedSubject == option ||
                          _selectedMarks == option ||
                          _selectedLanguage == option
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
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

    if (question.isEmpty) {
      CustomSnackbar.show(
        context,
        message: 'Please enter a question',
        variant: SnackbarVariant.error,
      );
      return;
    }

    setState(() {
      _isAsking = true;
      _isError = false;
      _currentAnswer = "";
      _currentQuestion = question; // Store the asked question
    });

    final url = Uri.parse('$baseUrl/question/ask');

    try {
      var request = http.Request("POST", url);
      request.headers['Content-Type'] = 'application/json';

      request.body = jsonEncode({
        "userId": userId ?? "",
        "question": question,
        "subjectData": subjectData ?? "",
        "boardData": boardData ?? "",
        "classData": classData ?? "",
        "marks": marks ?? "",
        "language": language ?? "",
      });

      // Send request and get streamed response
      var streamedResponse = await http.Client().send(request);

      if (streamedResponse.statusCode == 200) {
        final responseStream = streamedResponse.stream.transform(utf8.decoder);

        String buffer = "";

        await for (var chunk in responseStream) {
          buffer += chunk;

          try {
            // Try to parse JSON (assuming each chunk is a full JSON object)
            final jsonResponse = jsonDecode(buffer);

            final newQuestion =
                jsonResponse["question"] ?? question; // Extract question
            final newAnswer = jsonResponse["answer"] ?? ""; // Extract answer

            if (mounted) {
              setState(() {
                _currentQuestion = newQuestion;
                _currentAnswer = newAnswer;
              });
            }
          } catch (e) {
            // Ignore JSON errors until we get a full object
          }
        }

        if (mounted) {
          setState(() {
            _isAsking = false;
          });

          _questionController.clear();
          _selectedImage = null;
          _showAnswerDrawer();
        }
      } else {
        final responseData = await streamedResponse.stream.bytesToString();
        final jsonResponse = jsonDecode(responseData);
        final errorMessage = jsonResponse["error"] ?? "Unable to fetch data";

        if (mounted) {
          setState(() {
            _errorMessage = errorMessage;
            _isAsking = false;
            _isError = true;
          });

          _showAnswerDrawer();
        }
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _questionsList.insert(0, {
            "question": question,
            "answer": "Error connecting to server: $error",
            "subject": _selectedSubject ?? "Unknown",
            "time": "Just Now",
          });

          _isAsking = false;
          _isError = true;
        });

        _showAnswerDrawer();
      }
    }
  }

  void _showAnswerDrawer() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            ScrollController scrollController = ScrollController();
            double initialSize = 0.75;

            void scrollToBottom() {
              if (scrollController.hasClients) {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                );
              }
            }

            if (_isAsking || _currentAnswer.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                scrollToBottom();
              });
            }

            return DraggableScrollableSheet(
              initialChildSize: initialSize,
              minChildSize: 0.35,
              maxChildSize: 0.95,
              builder: (context, sheetScrollController) {
                final colorScheme = Theme.of(context).colorScheme;

                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorScheme.surface,
                        colorScheme.surfaceContainerLow,
                      ],
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Center(
                        child: Container(
                          width: 50,
                          height: 6,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: colorScheme.onSurface.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Question Section
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorScheme.primary.withOpacity(
                                          0.1,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.question_answer,
                                        size: 20,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      "Question",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                MarkdownBody(
                                  data: _currentQuestion ?? '',
                                  styleSheet: customMarkdownStyleSheet(context),
                                ),
                                const SizedBox(height: 24),
                                // Answer Section
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green.withOpacity(0.1),
                                      ),
                                      child: Icon(
                                        Icons.check_circle,
                                        size: 20,
                                        color: Colors.green.shade600,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      "Answer",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                if (_isError)
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: colorScheme.error.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: colorScheme.error.withOpacity(
                                          0.5,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: colorScheme.error,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            _errorMessage ??
                                                'Something went wrong',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: colorScheme.error,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else if (_isAsking && _currentAnswer.isEmpty)
                                  buildSkeletonLoader(context)
                                else
                                  MarkdownBody(
                                    selectable: true,
                                    data: _currentAnswer,
                                    builders: {
                                      'latex': LatexElementBuilder(
                                        textStyle: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                        textScaleFactor: 1.2,
                                      ),
                                    },
                                    extensionSet: md.ExtensionSet(
                                      [LatexBlockSyntax()],
                                      [LatexInlineSyntax()],
                                    ),
                                    styleSheet: customMarkdownStyleSheet(
                                      context,
                                    ),
                                  ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _buildInfoSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoTile(
            Icons.school,
            "Educational AI Assistant",
            "This app is designed to assist students in generating answers, explanations, and study material using AI-powered models.",
          ),
          _infoTile(
            Icons.computer,
            "Powered by AI",
            "It integrates OpenAI, Grok, and DeepSeek APIs to provide accurate and context-aware responses.",
          ),
          _infoTile(
            Icons.lightbulb,
            "Smart Learning",
            "Users can input questions and get detailed responses tailored to their educational needs.",
          ),
          _infoTile(
            Icons.book,
            "Multi-Language Support",
            "Supports multiple languages including English, Hindi, and Assamese for broader accessibility.",
          ),
          _infoTile(
            Icons.shield,
            "Privacy & Security",
            "User data is kept secure, and no personal information is shared with third parties.",
          ),
          _infoTile(
            Icons.settings,
            "Customizable Experience",
            "Offers customization options for personalized study sessions.",
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Studex",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            icon: Icon(
              Icons.history,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
            tooltip: 'View History',
          ),
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              _buildInfoSheet(context);
            },
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
                  color: Theme.of(
                    context,
                  ).colorScheme.surfaceContainer.withAlpha(200),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDropdownButton(
                          context,
                          "Subject",
                          _selectedSubject,
                          _subjects,
                          (value) => setState(() => _selectedSubject = value),
                          _showDropdown,
                        ),
                        buildDropdownButton(
                          context,
                          "Marks",
                          _selectedMarks,
                          _marksOptions,
                          (value) => setState(() => _selectedMarks = value),
                          _showDropdown,
                        ),
                        buildDropdownButton(
                          context,
                          "Language",
                          _selectedLanguage ?? "English",
                          _languageOptions,
                          (value) => setState(() => _selectedLanguage = value),
                          _showDropdown,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _questionController,
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary.withAlpha(240),
                      ),
                      decoration: InputDecoration(
                        hintText: "Type your question here...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: _questionController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
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
                        buildActionButton(
                          context,
                          Icons.camera_alt_outlined,
                          () => _pickImage(ImageSource.camera),
                          "Camera",
                        ),
                        buildActionButton(
                          context,
                          Icons.image_outlined,
                          () => _pickImage(ImageSource.gallery),
                          "Gallery",
                        ),
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
                                    width: 38,
                                    height: 38,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const Spacer(),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _isAsking
                              ? CupertinoActivityIndicator(
                                  color: Theme.of(context).colorScheme.primary,
                                  radius: 12,
                                )
                              : ElevatedButton(
                                  onPressed: _askQuestion,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Ask",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 18,
                                      ),
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
              child: _questionsList.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.question_answer,
                            size: 60,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ask a question to get started',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      itemCount: _questionsList.length,
                      itemBuilder: (context, index) {
                        final qna = _questionsList[index];
                        return QuestionCard(
                          questionId: qna["id"]!,
                          question: qna["question"]!,
                          subject: qna["subject"]!,
                          time: qna["time"]!,
                          answer: qna["answer"]!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
