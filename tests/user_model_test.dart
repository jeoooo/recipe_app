import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/models/user_model.dart';

void main() {
  group('User', () {
    test('fromJson should return a User object', () {
      final json = {
        'id': 1,
        'username': 'testuser',
        'email': 'testuser@example.com',
        'emailVisibility': true,
        'password': 'password',
        'passwordConfirm': 'password',
        'name': 'Test User',
        'role': 'user',
      };

      final user = User.fromJson(json);

      expect(user.user_id, json['id']);
      expect(user.username, json['username']);
      expect(user.email, json['email']);
      expect(user.emailVisibility, json['emailVisibility']);
      expect(user.password, json['password']);
      expect(user.passwordConfirm, json['passwordConfirm']);
      expect(user.name, json['name']);
      expect(user.role, json['role']);
    });

    test('toJson should return a JSON object', () {
      final user = User(
        user_id: 1,
        username: 'testuser',
        email: 'testuser@example.com',
        emailVisibility: true,
        password: 'password',
        passwordConfirm: 'password',
        name: 'Test User',
        role: 'user',
      );

      final json = user.toJson();

      expect(json['id'], user.user_id);
      expect(json['username'], user.username);
      expect(json['email'], user.email);
      expect(json['emailVisibility'], user.emailVisibility);
      expect(json['password'], user.password);
      expect(json['passwordConfirm'], user.passwordConfirm);
      expect(json['name'], user.name);
      expect(json['role'], user.role);
    });
  });
}
