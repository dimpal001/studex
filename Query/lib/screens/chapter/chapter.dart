class Chapter {
  String id;
  String name;
  // String subjectId;

  Chapter.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
  // subjectId = json['subjectId'];

  Map toJson() {
    return {'id': id, 'name': name};
  }
}
