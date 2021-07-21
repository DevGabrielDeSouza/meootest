	// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
	late FlutterDriver driver;

	setUpAll(() async {
		driver = await FlutterDriver.connect();
	});

	setUp(() async {
		await driver.requestData('restart');
	});

	tearDownAll(() async {
		driver.close();
	});

	group('Login', () {
		final loginButtonFinder = find.byValueKey('login-button');
		final userFieldFinder = find.byValueKey('user-field');
		final passwordFieldFinder = find.byValueKey('password-field');

		setUp(() async {
		await driver.requestData('restart');
		});

		test('When user insert an invalid email', () async {
		await driver.tap(userFieldFinder);
		await driver.enterText('tester-gmail.com');
		await driver.tap(passwordFieldFinder);
		await driver.enterText('1234567');

		await driver.tap(loginButtonFinder);

		await Future.delayed(const Duration(seconds: 3), () {});

		expect(await driver.getText(find.text('Invalid Email')), 'Invalid Email');

		await Future.delayed(const Duration(seconds: 5), () {});
		});

		test('When user insert a too short password', () async {
		await driver.tap(userFieldFinder);
		await driver.enterText('tester@gmail.com');
		await driver.tap(passwordFieldFinder);
		await driver.enterText('0');

		await driver.tap(loginButtonFinder);

		await Future.delayed(const Duration(seconds: 3), () {});

		expect(await driver.getText(find.text('Password too short')), 'Password too short');

		await Future.delayed(const Duration(seconds: 5), () {});
		});
	});

	group('Open Section', () {
		final menuBottomFinder = find.byValueKey('menu-bottom');
		final sectionsScrollFinder = find.byValueKey('sections-scroll');
		final sectionBoxFinder = find.byValueKey('section-box');

		final loginButtonFinder = find.byValueKey('login-button');
		final userFieldFinder = find.byValueKey('user-field');
		final passwordFieldFinder = find.byValueKey('password-field');

		test('When user open a section page', () async {
		await Future.delayed(const Duration(seconds: 5), () {});

		await driver.tap(userFieldFinder);
		await driver.enterText('tester@gmail.com');
		await driver.tap(passwordFieldFinder);
		await driver.enterText('1234567');

		await driver.tap(loginButtonFinder);

		await Future.delayed(const Duration(seconds: 1), () {});

		await driver.waitFor(menuBottomFinder);

		await driver.tap(find.text('Faturas'));

		await driver.scroll(
			sectionsScrollFinder, -400, 0, const Duration(milliseconds: 500));

		await Future.delayed(const Duration(seconds: 5), () {});

		await driver.tap(sectionBoxFinder);
		});
	});

	return;
}
