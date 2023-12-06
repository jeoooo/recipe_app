import 'package:sqflite/sqflite.dart';
import 'package:recipe_app/db/db_conn.dart';

class User {
  String? userId;
  String name;
  String email;
  String password;
  String role;

  User({
    this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}

class Auth {
  static final DatabaseHelper _databaseHelper = DatabaseHelper();

  static User? currentUser;

  static Future<bool> login(String email, String password) async {
    Database db = await _databaseHelper.database;

    List<Map<String, dynamic>> users = await db.query(
      '"users"',
      where: 'email_address = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (users.isNotEmpty) {
      currentUser = User(
        userId: users[0]['user_id'].toString(),
        name: users[0]['full_name'].toString(),
        email: users[0]['email_address'].toString(),
        password: users[0]['password'].toString(),
        role: users[0]['role'].toString(),
      );

      printUserDetails(currentUser);
      return true;
    }

    print('Login failed. Invalid email or password.');
    return false;
  }

  static Future<bool> signup(
      String name, String email, String password, String role) async {
    try {
      Database db = await _databaseHelper.database;

      await db.insert(
        '"users"',
        {
          'full_name': name,
          'email_address': email,
          'password': password,
          'role': role,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      print('User successfully registered.');
      return true;
    } catch (e) {
      print('Registration failed. $e');
      return false;
    }
  }

  static void printUserDetails(User? user) {
    if (user != null) {
      print('User Details:');
      print('User ID: ${user.userId}');
      print('Name: ${user.name}');
      print('Email: ${user.email}');
      print('Password: ${user.password}');
      print('Role: ${user.role}');
    } else {
      print('No user details available.');
    }
  }

  static bool isAuthenticated() {
    return currentUser != null;
  }

  static String getUserName() {
    return currentUser?.name ?? "";
  }
}
