import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/data/local/categories_box.dart';
import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/data/remote/services/category_service.dart';
import 'package:lseg/data/remote/services/content_service.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/local/local.dart';

class AppProviders {
  static getAppProviders(AppStorage appStorage,ConfigManager configManager,
      AuthService authService,
      UserService userService,
      ContentService contentService,
      CategoryService categoryService,
      ) {
    return [
      RepositoryProvider(create: (context) => appStorage),
      RepositoryProvider(
          create: (context) => AuthRepositoryImpl(appStorage, authService)),
      RepositoryProvider(
          create: (context) =>
              ContentRepositoryImpl(contentService, appStorage)),
      RepositoryProvider(
          create: (context) => CategoryRepositoryImpl(categoryService,CategoriesBox())),
      RepositoryProvider(create: (context) => OrderRepositoryImpl()),
      RepositoryProvider(create: (context) => TransactionRepositoryImpl()),
      RepositoryProvider(
          create: (context) => UserRepositoryImpl(appStorage, userService,contentService)),
      RepositoryProvider(create: (context) => GetHomeListing(RepositoryProvider.of<CategoryRepositoryImpl>(context), RepositoryProvider.of<ContentRepositoryImpl>(context),configManager)),
      RepositoryProvider(create: (context) => GetCategoryListing(RepositoryProvider.of<CategoryRepositoryImpl>(context), RepositoryProvider.of<ContentRepositoryImpl>(context))),
    ];
  }
}
