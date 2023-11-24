import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('users');

  User? _user;

  User? get user => _user;

  Future<void> initialize() async {
    await Firebase.initializeApp();
    await _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      _user = user;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String name, String email, String password, String role) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user data in Realtime Database
      await _database.child(authResult.user!.uid).set({
        'name': name,
        'email': email,
        'password': _hashPassword(password),
        'role': role,
      });

      // Fetch and update user's name
      await _fetchUserName(authResult.user!.uid);

      await _checkCurrentUser();
    } catch (e) {
      print('Error during sign up: $e');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch and update user's name
      await _fetchUserName(_auth.currentUser!.uid);

      await _checkCurrentUser();
    } catch (e) {
      print('Error during sign in: $e');
    }
  }

  Future<void> _fetchUserName(String userId) async {
    try {
      // Fetch the user's name from the Realtime Database
      var snapshot = await _database.child(userId).child('name').once();

      var name = snapshot;

      // Update the user's display name
      _user?.updateDisplayName(name.toString());
    } catch (e) {
      print("Error fetching user name: $e");
    }
  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
