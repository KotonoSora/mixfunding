import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mixfunding/core/presentation/login_view.dart';

void main() {
  group('LoginView', () {
    testWidgets('should display a string of text', (WidgetTester tester) async {
      const loginView = MaterialApp(
        home: LoginView(),
      );

      // Build loginView and trigger a frame.
      await tester.pumpWidget(loginView);

      // Verify loginView show title correct
      final titleFinder = find.byKey(ValueKey('title'));
      final titleWidget = tester.firstWidget<Text>(titleFinder);
      expect(titleFinder, findsOneWidget);
      expect(titleWidget.data, 'Login');

      // Verify loginView has field input email
      await tester.enterText(find.byKey(ValueKey('email_input')), 'email_test');
      expect(find.text('email_test'), findsOneWidget);

      // Verify loginView has field input password
      await tester.enterText(
          find.byKey(ValueKey('password_input')), 'password_test');
      expect(find.text('password_test'), findsOneWidget);

      // Verify loginView show button label correct
      final btnLoginFinder = find.byKey(ValueKey('btn_login'));
      final btnLoginLabelFinder = find.byKey(ValueKey('btn_login_label'));
      final btnLoginWidget = tester.firstWidget<ElevatedButton>(btnLoginFinder);
      final btnLoginLabelWidget = tester.firstWidget<Text>(btnLoginLabelFinder);
      expect(btnLoginFinder, findsOneWidget);
      expect(btnLoginLabelFinder, findsOneWidget);
      expect(btnLoginWidget.child, btnLoginLabelWidget);
      expect(btnLoginLabelWidget.data, 'Login');
    });
  });
}
