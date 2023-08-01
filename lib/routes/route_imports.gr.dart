// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:lseg/ui/screens/base_listing/base_listing_screen.dart' as _i1;
import 'package:lseg/ui/screens/categories/categories_screen.dart' as _i2;
import 'package:lseg/ui/screens/content_details/content_details_screen.dart'
    as _i3;
import 'package:lseg/ui/screens/creator_profile/creator_profile_screen.dart'
    as _i4;
import 'package:lseg/ui/screens/dashboard/dashboard_screen.dart' as _i5;
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen.dart' as _i6;
import 'package:lseg/ui/screens/favourites/favourites_screen.dart' as _i7;
import 'package:lseg/ui/screens/login/login_screen.dart' as _i8;
import 'package:lseg/ui/screens/my_content/my_content_screen.dart' as _i9;
import 'package:lseg/ui/screens/my_wallet/my_wallet_screen.dart' as _i10;
import 'package:lseg/ui/screens/onboarding/on_boarding_screen.dart' as _i11;
import 'package:lseg/ui/screens/registration/registration_screen.dart' as _i12;
import 'package:lseg/ui/screens/search_result/search_result_screen.dart'
    as _i13;
import 'package:lseg/ui/screens/splash/splash_screen.dart' as _i14;
import 'package:lseg/ui/screens/static_pages/contact_us_screen.dart' as _i15;
import 'package:lseg/ui/screens/static_pages/faq_screen.dart' as _i16;
import 'package:lseg/ui/screens/upload_content/upload_content_screen.dart'
    as _i17;
import 'package:lseg/ui/screens/withdraw_money/withdraw_money_screen.dart'
    as _i18;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    BaseListingRoute.name: (routeData) {
      final args = routeData.argsAs<BaseListingRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i1.BaseListingScreen(
          key: args.key,
          title: args.title,
        )),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i2.CategoriesScreen()),
      );
    },
    ContentDetailsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i3.ContentDetailsScreen()),
      );
    },
    CreatorProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i4.CreatorProfileScreen()),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i5.DashboardScreen()),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i6.EditProfileScreen()),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i7.FavouritesScreen()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i8.LoginScreen()),
      );
    },
    MyContentRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i9.MyContentScreen()),
      );
    },
    MyWalletRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i10.MyWalletScreen()),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i11.OnBoardingScreen()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i12.RegistrationScreen()),
      );
    },
    SearchResultRoute.name: (routeData) {
      final args = routeData.argsAs<SearchResultRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i13.SearchResultScreen(
          key: args.key,
          searchQuery: args.searchQuery,
        )),
      );
    },
    SplashRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreen(),
      );
    },
    ContactUsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ContactUsScreen(),
      );
    },
    FAQRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.FAQScreen(),
      );
    },
    UploadContentRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i17.UploadContentScreen()),
      );
    },
    WithdrawMoneyRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i18.WithdrawMoneyScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.BaseListingScreen]
class BaseListingRoute extends _i19.PageRouteInfo<BaseListingRouteArgs> {
  BaseListingRoute({
    _i20.Key? key,
    required String title,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          BaseListingRoute.name,
          args: BaseListingRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'BaseListingRoute';

  static const _i19.PageInfo<BaseListingRouteArgs> page =
      _i19.PageInfo<BaseListingRouteArgs>(name);
}

class BaseListingRouteArgs {
  const BaseListingRouteArgs({
    this.key,
    required this.title,
  });

  final _i20.Key? key;

  final String title;

  @override
  String toString() {
    return 'BaseListingRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.CategoriesScreen]
class CategoriesRoute extends _i19.PageRouteInfo<void> {
  const CategoriesRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContentDetailsScreen]
class ContentDetailsRoute extends _i19.PageRouteInfo<void> {
  const ContentDetailsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ContentDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContentDetailsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreatorProfileScreen]
class CreatorProfileRoute extends _i19.PageRouteInfo<void> {
  const CreatorProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreatorProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatorProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashboardScreen]
class DashboardRoute extends _i19.PageRouteInfo<void> {
  const DashboardRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditProfileScreen]
class EditProfileRoute extends _i19.PageRouteInfo<void> {
  const EditProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FavouritesScreen]
class FavouritesRoute extends _i19.PageRouteInfo<void> {
  const FavouritesRoute({List<_i19.PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyContentScreen]
class MyContentRoute extends _i19.PageRouteInfo<void> {
  const MyContentRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MyContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyContentRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MyWalletScreen]
class MyWalletRoute extends _i19.PageRouteInfo<void> {
  const MyWalletRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MyWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyWalletRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnBoardingScreen]
class OnBoardingRoute extends _i19.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RegistrationScreen]
class RegistrationRoute extends _i19.PageRouteInfo<void> {
  const RegistrationRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SearchResultScreen]
class SearchResultRoute extends _i19.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i20.Key? key,
    required String searchQuery,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SearchResultRoute.name,
          args: SearchResultRouteArgs(
            key: key,
            searchQuery: searchQuery,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchResultRoute';

  static const _i19.PageInfo<SearchResultRouteArgs> page =
      _i19.PageInfo<SearchResultRouteArgs>(name);
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({
    this.key,
    required this.searchQuery,
  });

  final _i20.Key? key;

  final String searchQuery;

  @override
  String toString() {
    return 'SearchResultRouteArgs{key: $key, searchQuery: $searchQuery}';
  }
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ContactUsScreen]
class ContactUsRoute extends _i19.PageRouteInfo<void> {
  const ContactUsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ContactUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.FAQScreen]
class FAQRoute extends _i19.PageRouteInfo<void> {
  const FAQRoute({List<_i19.PageRouteInfo>? children})
      : super(
          FAQRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.UploadContentScreen]
class UploadContentRoute extends _i19.PageRouteInfo<void> {
  const UploadContentRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UploadContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadContentRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.WithdrawMoneyScreen]
class WithdrawMoneyRoute extends _i19.PageRouteInfo<void> {
  const WithdrawMoneyRoute({List<_i19.PageRouteInfo>? children})
      : super(
          WithdrawMoneyRoute.name,
          initialChildren: children,
        );

  static const String name = 'WithdrawMoneyRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
