import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:testpoc/main.dart' as app;
import 'package:testpoc/main.dart';

void main() {
	// This line enables the extension.
	enableFlutterDriverExtension(handler: (command) async {
    switch (command) {
      case 'restart':
        _startApp();
        return 'ok';
    }
    throw Exception('Unknown command');
  });

	// Call the `main()` function of the app, or call `runApp` with
	// any widget you are interested in testing.
	app.main();
}

void _startApp() {
  runApp(
    MyApp(
      key: UniqueKey(),
    ),
  );
}
