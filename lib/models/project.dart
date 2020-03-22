class Project {
  final String id;
  final String title;
  final String apiKey;
  final bool active;
  Project({this.id, this.title, this.apiKey, this.active});

  factory Project.fromMap(Map data) {
    return Project(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      apiKey: data['apiKey'] ?? '',
      active: data['active'] ?? false,
    );
  }
  getMessages(data) {
    return ;
  }
}