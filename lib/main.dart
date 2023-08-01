import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lseg/app_initialization/app_initialization.dart';
import 'package:lseg/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
