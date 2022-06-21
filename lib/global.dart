import 'package:firebase_auth/firebase_auth.dart';

import 'model/database_model.dart';
import 'model/tasks.dart';
import 'model/user_model.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelcurrentInfo;
final List<Task> shoppingTask = [];
final List<Task> tasks = [];
final List<UserModel> userList = [];
final List<UserModel> familyList = [];
DatabaseModel databaseModel = DatabaseModel();
