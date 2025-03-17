import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddUserDetailsScreen extends StatefulWidget {
  const AddUserDetailsScreen({super.key});

  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddUserDetailsScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  List<Map<String, dynamic>> _classes = [];
  List<Map<String, dynamic>> _subjects = [];
  String? _selectedClassId;
  List<String> _selectedSubjectIds = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchClasses();
    _fetchSubjects();
  }

  Future<void> _fetchClasses() async {
    final url = Uri.parse('$baseUrl/class/get-classes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey("resData") &&
            responseData["resData"].containsKey("classes")) {
          final List<dynamic> classesData = responseData["resData"]["classes"];
          setState(() {
            _classes = classesData
                .map((item) =>
                    {"id": item["id"].toString(), "name": item["name"]})
                .toList();
          });
        } else {
          Alert.show(context, "Invalid response format",
              type: SnackbarType.error);
        }
      } else {
        Alert.show(context, "Failed to fetch classes",
            type: SnackbarType.error);
      }
    } catch (error) {
      Alert.show(context, "Error fetching classes", type: SnackbarType.error);
    }
  }

  Future<void> _fetchSubjects() async {
    final url = Uri.parse('$baseUrl/subject/get-subjects');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey("resData") &&
            responseData["resData"].containsKey("subjects")) {
          final List<dynamic> subjectsData =
              responseData["resData"]["subjects"];
          setState(() {
            _subjects = subjectsData
                .map((item) =>
                    {"id": item["id"].toString(), "name": item["name"]})
                .toList();
          });
        } else {
          Alert.show(context, "Invalid response format",
              type: SnackbarType.error);
        }
      } else {
        Alert.show(context, "Failed to fetch subjects",
            type: SnackbarType.error);
      }
    } catch (error) {
      Alert.show(context, "Error fetching subjects", type: SnackbarType.error);
    }
  }

  Future<void> _saveDetails() async {
    final String fullName = _fullNameController.text.trim();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    print(userId);

    if (fullName.isEmpty) {
      Alert.show(context, "Full name is required", type: SnackbarType.error);
      return;
    }

    if (_selectedClassId == null) {
      Alert.show(context, "Please select a class", type: SnackbarType.error);
      return;
    }

    if (_selectedSubjectIds.isEmpty) {
      Alert.show(context, "Please select at least one subject",
          type: SnackbarType.error);
      return;
    }

    if (userId == null) {
      Alert.show(context, "User ID not found", type: SnackbarType.error);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('$baseUrl/auth/update-user-data');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "data": {
            "id": userId,
            "fullName": fullName,
            "classId": _selectedClassId,
            "subjects": _selectedSubjectIds,
          },
        }),
      );

      final responseData = jsonDecode(response.body);
      print(responseData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Alert.show(context, "Details Saved Successfully",
            type: SnackbarType.success);

        await prefs.setString('token', responseData["resData"]["token"]);

        await prefs.setString(
            'fullName', responseData["resData"]["updatedUser"]["fullName"]);
        await prefs.setString(
            'className', responseData["resData"]["classData"]["name"]);
        await prefs.setString(
            'bio', responseData["resData"]["updatedUser"]["bio"] ?? "");
        await prefs.setString('profileUrl',
            responseData["resData"]["updatedUser"]["profileUrl"] ?? "");
        await prefs.setString(
            'classId', responseData["resData"]["classData"]["id"]);
        await prefs.setString('subjectsList',
            json.encode(responseData["resData"]["subjectData"]));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Alert.show(context, responseData["error"] ?? "Failed to save details",
            type: SnackbarType.error);
      }
    } catch (error) {
      print(error);
      Alert.show(context, "Error connecting to server",
          type: SnackbarType.error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Icon
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Profile",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          "Let’s make it personal!",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Full Name Field
                _buildSection(
                  title: "Full Name",
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _fullNameController,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7)),
                        hintText: "Enter your full name",
                        hintStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Class Dropdown
                _buildSection(
                  title: "Class",
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedClassId,
                      hint: Text("Select your class",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.5))),
                      dropdownColor:
                          Theme.of(context).colorScheme.surfaceContainer,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.class_,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                      ),
                      items: _classes.map((classItem) {
                        return DropdownMenuItem<String>(
                          value: classItem["id"],
                          child: Text(classItem["name"]),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedClassId = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Subjects Selection
                _buildSection(
                  title: "Subjects",
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        spacing: 12.0,
                        runSpacing: 2.0,
                        children: _subjects.map((subject) {
                          final isSelected =
                              _selectedSubjectIds.contains(subject["id"]);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedSubjectIds.remove(subject["id"]);
                                } else {
                                  _selectedSubjectIds.add(subject["id"]);
                                }
                              });
                            },
                            child: Chip(
                              label: Text(
                                subject["name"],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Theme.of(context)
                                          .colorScheme
                                          .onPrimary
                                          .withOpacity(0.7),
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              backgroundColor: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .surfaceContainer,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .surfaceContainer,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: _isLoading ? null : _saveDetails,
                    child: _isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2.5),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.save, color: Colors.white, size: 24),
                              SizedBox(width: 10),
                              Text(
                                "Save Profile",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
