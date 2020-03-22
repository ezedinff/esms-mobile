import 'models.dart';
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  //final List<Project> projects;
  const User({this.id, this.firstName, this.lastName, this.email, this.phone});
  factory User.fromMap(Map data) {
    return User(
      id: data['id'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? false,
      phone: data['phone'] ?? false,
      //projects: (data['projects'] as List ?? []).map((v) => Project.fromMap(v)).toList(), //data['projects'],
    );
  }
}
