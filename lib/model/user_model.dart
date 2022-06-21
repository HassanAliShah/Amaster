import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? id;
  String? email;

  UserModel({this.email, this.id, this.firstName, this.lastName});

  UserModel.fromSnapshot(DataSnapshot snap) {
    firstName = (snap.value as dynamic)["firstname"];
    lastName = (snap.value as dynamic)["lastname"];
    id = snap.key;
    email = (snap.value as dynamic)["email"];
  }

  get firstname {
    return firstName;
  }

  get lastname {
    return lastName;
  }

  get uid {
    return id;
  }
}
