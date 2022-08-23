import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:mixfunding/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test LoginView', () {
    testWidgets('should display a string of text', (tester) async {
      app.main();
      await tester.pumpAndSettle();

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
