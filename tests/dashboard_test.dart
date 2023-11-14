// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/views/client/dashboard.dart';

void main() {
  group('Dashboard Widget Tests', () {
    testWidgets('Widget displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Dashboard(
            name: 'Test User',
            token: 'test_token',
            id: 'test_id',
          ),
        ),
      );
    });

    testWidgets('Switching between own and other\'s recipes works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Dashboard(
            name: 'Test User',
            token: 'test_token',
            id: 'test_id',
          ),
        ),
      );

      // Tap the "Other's Recipes" button
      await tester.tap(find.text("Other's Recipes"));
      await tester.pump();

      // Tap the "Own Recipes" button
      await tester.tap(find.text("Own Recipes"));
      await tester.pump();
    });
  });
}
