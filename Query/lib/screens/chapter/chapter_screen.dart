import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/chapter/chapter.dart';

class ChapterScreen extends StatefulWidget {
  final String subjectId; // Add subjectId to the class

  ChapterScreen({Key? key, required this.subjectId}) : super(key: key);

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  List<Chapter> subjectList = [];
  String errorMessage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClassIdAndChapters();
  }

  Future<void> fetchClassIdAndChapters() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF292935),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const Text(
                    "Chapters",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF292935),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Color(0xFFF0363F),
              ))
            : errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: subjectList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print("");
                        },
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xFF222252),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.question_answer,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    subjectList[index]
                                        .name
                                        .split(' ')
                                        .map((str) =>
                                            str[0].toUpperCase() +
                                            str.substring(1).toLowerCase())
                                        .join(' '),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
