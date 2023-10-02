import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
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
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
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

  runApp(MyApp());
}
