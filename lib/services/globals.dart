import 'package:esms/models/message.dart';
import 'package:esms/models/models.dart';

import 'services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


/// Static global state. Immutable services that do not care about build context. 
class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

    // Data Models
  static final Map models = {
    User: (data) => User.fromMap(data),
    Project: (data) => Project.fromMap(data),
    Message: (data) => Message.fromMap(data)
  };

  static final Table<Project> projectTableRef = Table<Project>(table: 'projects');

  // Firestore References for Writes
  static final Collection<Message> messageRef = Collection<Message>(path: 'messages');
  static final Collection<Project> projectRef = Collection<Project>(path: 'projects');
  //static final UserData<Project> projectRef = UserData<Project>(collection: 'projects');

}
