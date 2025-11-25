import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  void createUser(String name, String email, String hashed_password) {
    final user = <String, dynamic>{
      "name": name,
      "email": email,
      "hashed_password": hashed_password,
    };

    db.collection('users').add(user).then((value) {
      print("User Added");
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
