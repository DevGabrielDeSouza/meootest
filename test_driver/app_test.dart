// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
	group('Counter App', () {

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
			//await Future.delayed(const Duration(seconds: 10), () {});
		});

		// Close the connection to the driver after the tests have completed.
		tearDownAll(() async {
			driver.close();
		});
		
		tearDown(() async{
			await driver.requestData('restart');
		});

		test('When user insert an invalid email', () async{
			await driver.tap(userFieldFinder);
			await driver.enterText('tester-gmail.com');
			await driver.tap(passwordFieldFinder);
			await driver.enterText('1234567');
      		
			await driver.tap(loginButtonFinder);

     		await Future.delayed(const Duration(seconds: 5), () {});
		});

		test('When user insert an invalid email', () async{
			await driver.tap(userFieldFinder);
			await driver.enterText('tester-gmail.com');
			await driver.tap(passwordFieldFinder);
			await driver.enterText('0');
      		
			await driver.tap(loginButtonFinder);

     		await Future.delayed(const Duration(seconds: 5), () {});
		});
		


		test('When user open a section page',() async {
			await driver.tap(userFieldFinder);
			await driver.enterText('tester@gmail.com');
			await driver.tap(passwordFieldFinder);
			await driver.enterText('1234567');

			await driver.tap(loginButtonFinder);



			await Future.delayed(const Duration(seconds: 1), () {});

			await driver.waitFor(menuBottomFinder);


			await driver.tap(find.text('Faturas'));



			await driver.scroll(sectionsScrollFinder, -400, 0, const Duration(milliseconds: 500));

			await Future.delayed(const Duration(seconds: 5), () {});


			
			await driver.tap(sectionBoxFinder);
			
			await Future.delayed(const Duration(seconds: 3), () {});

			await driver.requestData('restart');
			
			
			await Future.delayed(const Duration(seconds: 6), () {});


		});
	});
}
