class Subject {
  final String id;
  final String userId;
  final String subjectId;
  final String name;

  Subject({
    required this.id,
    required this.userId,
    required this.subjectId,
    required this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      subjectId: json['subjectId'] ?? '',
      name: json['subject']?['name'] ?? '',
    );
  }
}
