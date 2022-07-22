import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:prototype/src/di/components/injection.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  configureInjection(Env.development);
  runApp(MyApp());
}

