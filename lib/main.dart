import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lseg/app_initialization/app_initialization.dart';
import 'package:lseg/firebase_options.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initRemoteConfig(FirebaseRemoteConfig remoteConfig) async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 5),
  ));
  await remoteConfig.fetchAndActivate();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initRemoteConfig(FirebaseRemoteConfig.instance);
  await Hive.initFlutter();
  UnityAds.init(
    gameId: '5390827',
    onComplete: () => print('Initialization Complete'),
    onFailed: (error, message) =>
        print('Initialization Failed: $error $message'),
  );

  // await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);
  runApp(MyApp());
}
