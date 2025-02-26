import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';

class ExamReportScreen extends StatefulWidget {
  const ExamReportScreen({Key? key}) : super(key: key);

  @override
  State<ExamReportScreen> createState() => _ExamReportScreenState();
}

class _ExamReportScreenState extends State<ExamReportScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  final examResult = {
    'id': 'exam_attempt_123',
    'examName': 'Mathematics Final Exam',
    'subject': 'Mathematics',
    'topic': 'Algebra',
    'duration': 120,
    'noOfQuestions': 50,
    'result': 92.6,
    'status': 'COMPLETED',
    'createdAt': DateTime.now(),
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _progressAnimation =
        Tween<double>(begin: 0, end: examResult['result'] as double).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: const Text(
          'Exam Report',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ScoreCard(
                  examResult: examResult,
                  progressAnimation: _progressAnimation),
              const SizedBox(height: 20),
              ExamDetailsCard(examResult: examResult),
              const SizedBox(height: 20),
              ActionButtons(
                onQuestionsTap: () => _showQuestionsDrawer(context),
                onChallengeTap: () => _showChallengeDrawer(context),
                onShareTap: () => _showShareDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQuestionsDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuestionsDrawer(),
    );
  }

  void _showChallengeDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ChallengeDrawer(),
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ShareDialog(examResult: examResult),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final Map<String, dynamic> examResult;
  final Animation<double> progressAnimation;

  const ScoreCard(
      {Key? key, required this.examResult, required this.progressAnimation})
      : super(key: key);

  Color getScoreColor(double score) {
    if (score >= 85) {
      return Colors.greenAccent;
    } else if (score >= 70) {
      return Colors.orangeAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color scoreColor = getScoreColor(examResult["result"]);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(examResult['examName'],
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: progressAnimation,
            builder: (context, child) => Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: progressAnimation.value / 100,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(scoreColor),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${progressAnimation.value.toStringAsFixed(1)}%',
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const Text('Score',
                        style: TextStyle(fontSize: 16, color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Congratulations on completing your exam!',
              style:
                  TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class ExamDetailsCard extends StatelessWidget {
  final Map<String, dynamic> examResult;

  const ExamDetailsCard({Key? key, required this.examResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.foreground, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Exam Details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 16),
          _buildDetailRow('Subject', examResult['subject']),
          _buildDetailRow('Topic', examResult['topic']),
          _buildDetailRow('Duration', '${examResult['duration']} minutes'),
          _buildDetailRow('Questions', examResult['noOfQuestions'].toString()),
          _buildDetailRow(
              'Date', examResult['createdAt'].toString().substring(0, 10)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16, color: Colors.white.withOpacity(0.7))),
          Text(value,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final VoidCallback onQuestionsTap;
  final VoidCallback onChallengeTap;
  final VoidCallback onShareTap;

  const ActionButtons(
      {Key? key,
      required this.onQuestionsTap,
      required this.onChallengeTap,
      required this.onShareTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 10,
      children: [
        _buildButton('Questions', Icons.quiz, onQuestionsTap),
        _buildButton('Challenge', Icons.sports_esports, onChallengeTap),
        _buildButton('Share', Icons.share, onShareTap),
      ],
    );
  }

  Widget _buildButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.foreground,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary), // Icon added
          const SizedBox(width: 8), // Spacing between icon and text
          Text(
            label,
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class QuestionsDrawer extends StatelessWidget {
  QuestionsDrawer({Key? key}) : super(key: key);

  final Map<String, dynamic> examData = {
    "id": "exam_12345",
    "name": "Science Practice Test",
    "subject": {"name": "Physics"},
    "topic": "Physics - Motion and Force",
    "duration": 5,
    "noOfQuestions": 5,
    "questions": [
      {
        "id": "question_001",
        "question": "What is the unit of force?",
        "optionA": "Newton",
        "optionB": "Joule",
        "optionC": "Watt",
        "optionD": "Pascal",
        "correctAns": "A",
        "userAnswer": "A",
      },
      {
        "id": "question_002",
        "question": "Which of the following is a scalar quantity?",
        "optionA": "Velocity",
        "optionB": "Acceleration",
        "optionC": "Speed",
        "optionD": "Force",
        "correctAns": "C",
        "userAnswer": "B",
      },
      {
        "id": "question_003",
        "question": "What is the acceleration due to gravity on Earth?",
        "optionA": "8.9 m/s²",
        "optionB": "9.8 m/s²",
        "optionC": "10.8 m/s²",
        "optionD": "7.6 m/s²",
        "correctAns": "B",
        "userAnswer": "B",
      },
      {
        "id": "question_004",
        "question":
            "Which of the following laws states that force equals mass times acceleration?",
        "optionA": "Newton's First Law",
        "optionB": "Newton's Second Law",
        "optionC": "Newton's Third Law",
        "optionD": "Law of Conservation of Energy",
        "correctAns": "B",
        "userAnswer": "C",
      },
      {
        "id": "question_005",
        "question":
            "What happens to an object when the net force acting on it is zero?",
        "optionA": "It accelerates",
        "optionB": "It comes to rest",
        "optionC": "It moves with constant velocity",
        "optionD": "It changes direction",
        "correctAns": "C",
        "userAnswer": null,
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final questions = examData['questions'] as List<Map<String, dynamic>>;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Questions Review',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return _buildQuestionCard(context, question, index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(
      BuildContext context, Map<String, dynamic> question, int questionNumber) {
    final correctAns = question['correctAns'] as String;
    final userAnswer = question['userAnswer'] as String?;
    final isCorrect = userAnswer != null && userAnswer == correctAns;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: AppColors.foreground.withOpacity(0.9),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question $questionNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                question['question'] as String,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 12),
              _buildOption('A', question['optionA'], correctAns, userAnswer),
              _buildOption('B', question['optionB'], correctAns, userAnswer),
              _buildOption('C', question['optionC'], correctAns, userAnswer),
              _buildOption('D', question['optionD'], correctAns, userAnswer),
              const SizedBox(height: 12),
              _buildAnswerSummary(correctAns, userAnswer),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String optionKey, String? optionText, String correctAns,
      String? userAnswer) {
    final isCorrect = optionKey == correctAns;
    final isUserAnswer = optionKey == userAnswer;
    final textColor = isCorrect
        ? Colors.green
        : (isUserAnswer && !isCorrect)
            ? Colors.red
            : Colors.white70;
    final backgroundColor = isCorrect
        ? Colors.green.withOpacity(0.1)
        : (isUserAnswer && !isCorrect)
            ? Colors.red.withOpacity(0.1)
            : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              '$optionKey. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Expanded(
              child: Text(
                optionText ?? '',
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerSummary(String correctAns, String? userAnswer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Correct Answer: $correctAns',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Your Answer: ${userAnswer ?? 'Not Answered'}',
          style: TextStyle(
            fontSize: 14,
            color: userAnswer == null
                ? Colors.grey
                : userAnswer == correctAns
                    ? Colors.green
                    : Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ChallengeDrawer extends StatefulWidget {
  const ChallengeDrawer({Key? key}) : super(key: key);

  @override
  State<ChallengeDrawer> createState() => _ChallengeDrawerState();
}

class _ChallengeDrawerState extends State<ChallengeDrawer> {
  final List<Map<String, dynamic>> demoUsers = [
    {
      'id': 'u1',
      'name': 'John Doe',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=1',
      'selected': false
    },
    {
      'id': 'u2',
      'name': 'Jane Smith',
      'class': '10B',
      'profileUrl': 'https://i.pravatar.cc/150?img=2',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
    {
      'id': 'u3',
      'name': 'Alice Johnson',
      'class': '10A',
      'profileUrl': 'https://i.pravatar.cc/150?img=3',
      'selected': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: AppColors.background, // Dark themed background
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // 🔹 Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Challenge Friends',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // 🔹 User List with Checkbox
          Expanded(
            child: ListView.builder(
              itemCount: demoUsers.length,
              itemBuilder: (context, index) {
                final user = demoUsers[index];

                return GestureDetector(
                  onTap: () {
                    setState(() => user['selected'] = !user['selected']);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: user['selected']
                          ? AppColors.primary.withOpacity(0.03)
                          : Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        // 🔹 Profile Avatar
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(user['profileUrl']),
                        ),
                        SizedBox(width: 12),

                        // 🔹 Name & Class
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Class: ${user['class']}',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 🔹 Circular Checkbox
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            shape: CircleBorder(),
                            value: user['selected'],
                            onChanged: (value) {
                              setState(() => user['selected'] = value!);
                            },
                            activeColor: AppColors.primary,
                            checkColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // 🔹 Send Challenge Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed:
                  demoUsers.any((user) => user['selected']) ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Send Challenge',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShareDialog extends StatefulWidget {
  final Map<String, dynamic> examResult;

  const ShareDialog({Key? key, required this.examResult}) : super(key: key);

  @override
  State<ShareDialog> createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.foreground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Share Your Result',
          style: TextStyle(color: Colors.white)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Exam: ${widget.examResult['examName']}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Score: ${widget.examResult['result']}%'),
                Text('Subject: ${widget.examResult['subject']}'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _captionController,
            decoration: const InputDecoration(
              labelText: 'Add a caption',
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:
              const Text('Cancel', style: TextStyle(color: AppColors.primary)),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle share action here
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: const Text('Share'),
        ),
      ],
    );
  }
}
