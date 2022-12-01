import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di.dart';
import 'app.dart';

Future main() async {
  // Load the environment variables of the build flavour.
  await dotenv.load(fileName: 'dev.env');

  // Make sure the instance of WidgetsBinding before calling native code.
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection
  di.setup();

  runApp(const PublicCompanyInformationApp());
}
