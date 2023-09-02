import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lseg/app_initialization/app_initialization.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/data/remote/firebase_data_source/firebase_category_service_impl.dart';
import 'package:lseg/data/remote/firebase_data_source/firebase_content_service_impl.dart';
import 'package:lseg/data/remote/services/category_service.dart';
import 'package:lseg/data/remote/services/content_service.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  final _configManager = ConfigManager();
  final _appStorage = AppStorage();
  final AuthService _authService = FirebaseAuthService();
  final UserService _userService = FirebaseUserService();
  final ContentService _contentService = FirebaseContentServiceImpl();
  final CategoryService _categoryService = FirebaseCategoryServiceImpl();

  final ThemeData theme =  AppTheme.getAppTheme();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: AppProviders.getAppProviders(
        _appStorage,
        _configManager,
        _authService,
        _userService,
        _contentService,
        _categoryService,
      ),
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        builder: FlutterSmartDialog.init(
          //default loading widget
          loadingBuilder: (String msg) => const CustomLoading(type: 1),
        ),
        color: AppColors.primary,
        theme:theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.black),
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
