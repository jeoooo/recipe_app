import 'package:firebase_database/firebase_database.dart';

class UserDatabase {
  Future<dynamic> getName(String userId) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$userId/name').get();
    if (snapshot.exists) {
      return snapshot.value.toString();
    } else {
      return "no data";
    }
  }
}
