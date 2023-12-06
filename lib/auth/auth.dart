// auth.dart

class User {
  String? userId;
  String name;
  String email;
  String password;
  String role;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}

class Auth {
  static List<User> users = []; // Simulated user database

  static User? currentUser;

  static Future<bool> login(String email, String password) async {
    // Perform authentication logic, e.g., check credentials against a database
    // If authentication is successful, set the currentUser
    // Otherwise, return false

    // For simplicity, we'll just check against hardcoded values
    for (var user in users) {
      if (user.email == email && user.password == password) {
        currentUser = user;
        return true;
      }
    }
    return false;
  }

  static Future<bool> signup(
      String name, String email, String password, String role) async {
    // Perform signup logic, e.g., add user to the database
    // If signup is successful, set the currentUser
    // Otherwise, return false

    // For simplicity, we'll add the user to the simulated user database
    // In a real-world scenario, you would perform database operations
    var newUser = User(
      name: name,
      email: email,
      password: password,
      role: role,
    );
    users.add(newUser);
    currentUser = newUser;
    return true;
  }

  static void logout() {
    // Clear the currentUser when the user logs out
    currentUser = null;
  }

  static bool isAuthenticated() {
    // Check if a user is authenticated (currentUser is not null)
    return currentUser != null;
  }

  static String getUserId() {
    // Get the user ID of the authenticated user
    return currentUser?.userId ?? "";
  }
}
