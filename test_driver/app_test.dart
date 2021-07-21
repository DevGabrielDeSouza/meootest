// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    final loginButtonFinder = find.byValueKey('login-button');
    final userFieldFinder = find.byValueKey('user-field');
    final passwordFieldFinder = find.byValueKey('password-field');


    final menuBottomFinder = find.byValueKey('menu-bottom');
    final sectionsScrollFinder = find.byValueKey('sections-scroll');
    final sectionBoxFinder = find.byValueKey('section-box');

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await Future.delayed(const Duration(seconds: 10), () {});
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });
    test('When user insert the proper login, app should load the Store Page',
        () async {


      await driver.tap(userFieldFinder);
      await driver.enterText('tester@gmail.com');
      await driver.tap(passwordFieldFinder);
      await driver.enterText('test123');

      // First, tap the button.
      await driver.tap(loginButtonFinder);



      await Future.delayed(const Duration(seconds: 1), () {});

      await driver.waitFor(menuBottomFinder);
      //await driver.setSemantics(true);
      //await driver.tap(find.bySemanticsLabel('Faturas'));


      await driver.tap(find.text('Faturas'));



      await driver.scroll(sectionsScrollFinder, -400, 0, const Duration(milliseconds: 500));

      await Future.delayed(const Duration(seconds: 5), () {});


      
      await driver.tap(sectionBoxFinder);
      
      await Future.delayed(const Duration(seconds: 3), () {});

      // Then, verify the counter text is incremented by 1.
      //expect(await driver.getText(counterTextFinder), "1");
    });

    /*test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });

    test('increments the counter during animation', () async {
      await driver.runUnsynchronized(() async {
        // First, tap the button.
        await driver.tap(buttonFinder);

        // Then, verify the counter text is incremented by 1.
        expect(await driver.getText(counterTextFinder), "1");
      });
    });*/
  });
}
