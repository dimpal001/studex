import 'package:flutter/material.dart';

class NewExamForm extends StatefulWidget {
  @override
  _NewExamFormState createState() => _NewExamFormState();
}

class _NewExamFormState extends State<NewExamForm> {
  final Color primaryColor = const Color(0xFFF0363F);
  final Color buttonColor = const Color(0xFF292935);

  String examName = '';
  String? selectedSubject;
  String topic = '';
  int noOfQuestions = 0;
  int duration = 0;

  final List<String> subjects = ["Math", "Science", "English", "History"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIconButton(
                    Icons.arrow_back, () => Navigator.of(context).pop()),
                const Text(
                  "New Exam",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                buildIconButton(Icons.more_vert, () {}),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Enter Exam Details"),
            buildTextField("Exam Name", (value) => examName = value),
            buildDropdownField(),
            buildTextField("Topic", (value) => topic = value),
            buildNumberField("No. of Questions",
                (value) => noOfQuestions = int.tryParse(value) ?? 0),
            buildNumberField("Duration (minutes)",
                (value) => duration = int.tryParse(value) ?? 0),
            const SizedBox(height: 30),
            buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, VoidCallback onTap) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 6, offset: Offset(2, 3)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }

  Widget buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildTextField(String label, Function(String) onSave) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: inputDecoration(label),
        onChanged: (value) => onSave(value),
      ),
    );
  }

  Widget buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: inputDecoration("Select Subject"),
        dropdownColor: buttonColor,
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        style: TextStyle(color: Colors.white),
        value: selectedSubject,
        items: subjects.map((subject) {
          return DropdownMenuItem(value: subject, child: Text(subject));
        }).toList(),
        onChanged: (value) => setState(() => selectedSubject = value),
      ),
    );
  }

  Widget buildNumberField(String label, Function(String) onSave) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: inputDecoration(label),
        onChanged: (value) => onSave(value),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      hintStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: buttonColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  Widget buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Exam Created Successfully!")));
          Navigator.pop(context);
        },
        child: const Text("Create Exam",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
