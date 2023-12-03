// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:recipe_app/auth/auth.dart';
// import 'package:recipe_app/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   final FirebaseAuthService authService = FirebaseAuthService();
//   runApp(
//     MaterialApp(
//       home: MockAuthScreen(authService: authService),
//     ),
//   );
// }

// class MockAuthScreen extends StatefulWidget {
//   final FirebaseAuthService authService;

//   MockAuthScreen({required this.authService});

//   @override
//   _MockAuthScreenState createState() => _MockAuthScreenState();
// }

// class _MockAuthScreenState extends State<MockAuthScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mock Auth Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 await widget.authService.initialize();
//                 await widget.authService.signOut();
//                 print('User signed out.');
//               },
//               child: Text('Sign Out'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 String email = emailController.text;
//                 String password = passwordController.text;
//                 await widget.authService
//                     .createUserWithEmailAndPassword(email, password,);
//                 print('User created with email: $email');
//               },
//               child: Text('Create User'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 String email = emailController.text;
//                 String password = passwordController.text;
//                 await widget.authService
//                     .signInWithEmailAndPassword(email, password);
//                 print('User signed in with email: $email');
//               },
//               child: Text('Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
