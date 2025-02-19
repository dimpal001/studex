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
    "Bangali"
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
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Color(0xFF171720)),
          child: ListView(
            shrinkWrap: true,
            children: options.map((option) {
              return ListTile(
                title:
                    Text(option, style: const TextStyle(color: Colors.white)),
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
          "subject": "Computer Science",
          "time": "2h ago",
          "answer": answer
        });

        _questionController.clear();
        setState(() {
          _selectedImage = null;
        });
      } else {
        final errorMessage = responseData["error"] ?? "Unable to fetch data";
        print("Error Message: $errorMessage");
        Alert.show(context, errorMessage, type: SnackbarType.error);
      }
    } catch (error) {
      print("Error: ${error.toString()}");
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
        title: Text(
          "AskMe",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.foreground,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF292935),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () =>
                              _showDropdown(context, _subjects, (value) {
                            setState(() => _selectedSubject = value);
                          }),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E1E2A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _selectedSubject ?? "Subject",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      SizedBox(
                        width: 80,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () =>
                              _showDropdown(context, _marksOptions, (value) {
                            setState(() => _selectedMarks = value);
                          }),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E1E2A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _selectedMarks ?? "Marks",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      SizedBox(
                        width: 90,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () =>
                              _showDropdown(context, _languageOptions, (value) {
                            setState(() => _selectedLanguage = value);
                          }),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E1E2A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _selectedLanguage ?? "English",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
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
                      fillColor: const Color(0xFF1E1E2A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    minLines: 3, // Minimum height (3 lines)
                    maxLines: 6, // Maximum height (6 lines)
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _pickImage(ImageSource.camera),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF463132),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.camera_alt_outlined,
                              color: Color(0xFFF0363F), size: 18),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _pickImage(ImageSource.gallery),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF463132),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.image_outlined,
                              color: Color(0xFFF0363F), size: 18),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (_selectedImage != null)
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(_selectedImage!.path),
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      const Spacer(),
                      _isAsking
                          ? Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                                child: CupertinoActivityIndicator(
                                  color: Color(0xFFF0363F),
                                  radius: 12,
                                ),
                              ),
                            )
                          : InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: _isAsking ? null : _askQuestion,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xFF463132),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.arrow_forward,
                                    color: Color(0xFFF0363F), size: 18),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: demoData.map((data) {
                      return QuestionCard(
                        question: data["question"]!,
                        subject: data["subject"]!,
                        time: data["time"]!,
                        answer: data["answer"]!,
                      );
                    }).toList(), // Fixed map function
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
