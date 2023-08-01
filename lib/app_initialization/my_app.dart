import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lseg/app_initialization/app_initialization.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: AppProviders.getAppProviders(),
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        builder: FlutterSmartDialog.init(
          //default loading widget
          loadingBuilder: (String msg) => const CustomLoading(type: 1),
        ),
        theme: AppTheme.getAppTheme(),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
