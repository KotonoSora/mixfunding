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

  group('end-to-end test botToast', () {
    Future click(WidgetTester tester) async {
      await tester.tap(find.byKey(ValueKey('btn_login')));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
    }

    testWidgets('should warning input full email and password',
        (WidgetTester widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      await click(widgetTester);

      expect(find.text('Warning'), findsOneWidget);
      expect(find.text('Please enter your full email and password'),
          findsOneWidget);
      await widgetTester.pumpAndSettle(const Duration(seconds: 3));
      await widgetTester.pumpAndSettle();
      expect(find.text('Warning'), findsNothing);
      expect(
          find.text('Please enter your full email and password'), findsNothing);
    });

    testWidgets('should warning email is invalid',
        (WidgetTester widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(
          find.byKey(ValueKey('email_input')), 'email_test');
      await widgetTester.enterText(
          find.byKey(ValueKey('password_input')), 'password_test');

      await click(widgetTester);

      expect(find.text('Warning'), findsOneWidget);
      expect(find.text('The email is invalid. Please enter again'),
          findsOneWidget);
      await widgetTester.pumpAndSettle(const Duration(seconds: 3));
      await widgetTester.pumpAndSettle();
      expect(find.text('Warning'), findsNothing);
      expect(
          find.text('Please enter your full email and password'), findsNothing);
    });

    testWidgets('should warning password is invalid',
        (WidgetTester widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(
          find.byKey(ValueKey('email_input')), 'email@test.com');
      await widgetTester.enterText(
          find.byKey(ValueKey('password_input')), 'password_test');

      await click(widgetTester);

      String warning = 'The password must be 8 characters long,'
          ' must contain at least 1 uppercase letter, 1 lowercase letter, 1 number,'
          ' and must not contain spaces.'
          ' Please enter again';
      expect(find.text('Warning'), findsOneWidget);
      expect(find.text(warning), findsOneWidget);
      await widgetTester.pumpAndSettle(const Duration(seconds: 3));
      await widgetTester.pumpAndSettle();
      expect(find.text('Warning'), findsNothing);
      expect(find.text(warning), findsNothing);
    });

    testWidgets('should not show any warning',
        (WidgetTester widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(
          find.byKey(ValueKey('email_input')), 'email@test.com');
      await widgetTester.enterText(
          find.byKey(ValueKey('password_input')), 'Test123!');

      await click(widgetTester);

      expect(find.text('Warning'), findsNothing);
      await widgetTester.pumpAndSettle(const Duration(seconds: 3));
      await widgetTester.pumpAndSettle();
      expect(find.text('Warning'), findsNothing);
    });
  });
}
