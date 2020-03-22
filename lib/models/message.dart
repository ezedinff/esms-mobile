class Message {
  final String id;
  final String apiKey;
  final String to;
  final String text;
  int status;
  Message({this.id, this.apiKey, this.to, this.text, this.status});
  factory Message.fromMap(Map data) {
    return Message(
      id: data['id'] ?? '',
      apiKey: data['apiKey'] ?? '',
      to: data['to'] ?? '',
      text: data['text'] ?? '',
      status: data['status'] ?? 0,
    );
  }
  setStatus(s) {
    this.status = s;
  }
}
