import 'package:flutter/material.dart';

import 'di.dart';
import 'app.dart';

void main() {
  di.setup();
  runApp(const PublicCompanyInformationApp());
}
