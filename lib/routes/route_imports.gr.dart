// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:lseg/domain/domain.dart' as _i27;
import 'package:lseg/ui/screens/base_listing/base_listing_screen.dart' as _i1;
import 'package:lseg/ui/screens/categories/categories_screen.dart' as _i2;
import 'package:lseg/ui/screens/category_contents/category_content_screen.dart'
    as _i3;
import 'package:lseg/ui/screens/content_details/content_details_screen.dart'
    as _i4;
import 'package:lseg/ui/screens/content_viewer/content_viewer_screen.dart'
    as _i5;
import 'package:lseg/ui/screens/creator_profile/creator_profile_screen.dart'
    as _i6;
import 'package:lseg/ui/screens/dashboard/dashboard_screen.dart' as _i7;
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen.dart' as _i8;
import 'package:lseg/ui/screens/favourites/favourites_screen.dart' as _i9;
import 'package:lseg/ui/screens/login/login_screen.dart' as _i10;
import 'package:lseg/ui/screens/my_content/my_content_screen.dart' as _i11;
import 'package:lseg/ui/screens/my_wallet/my_wallet_screen.dart' as _i12;
import 'package:lseg/ui/screens/onboarding/on_boarding_screen.dart' as _i13;
import 'package:lseg/ui/screens/purchase_content_screen/purchase_content_screen.dart'
    as _i15;
import 'package:lseg/ui/screens/purchased_content/purchased_content_screen.dart'
    as _i14;
import 'package:lseg/ui/screens/registration/registration_screen.dart' as _i16;
import 'package:lseg/ui/screens/search_result/search_result_screen.dart'
    as _i17;
import 'package:lseg/ui/screens/splash/splash_screen.dart' as _i18;
import 'package:lseg/ui/screens/static_pages/contact_us_screen.dart' as _i19;
import 'package:lseg/ui/screens/static_pages/faq_screen.dart' as _i20;
import 'package:lseg/ui/screens/static_pages/privacy_policy_screen.dart'
    as _i21;
import 'package:lseg/ui/screens/static_pages/terms_n_conditions_screen.dart'
    as _i22;
import 'package:lseg/ui/screens/upload_content/upload_content_screen.dart'
    as _i23;
import 'package:lseg/ui/screens/withdraw_money/withdraw_money_screen.dart'
    as _i24;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    BaseListingRoute.name: (routeData) {
      final args = routeData.argsAs<BaseListingRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i1.BaseListingScreen(
          key: args.key,
          title: args.title,
          type: args.type,
          categoryId: args.categoryId,
        )),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i2.CategoriesScreen()),
      );
    },
    CategoryContentRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryContentRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i3.CategoryContentScreen(
          key: args.key,
          categoryModel: args.categoryModel,
        )),
      );
    },
    ContentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ContentDetailsRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i4.ContentDetailsScreen(
          key: args.key,
          contentModel: args.contentModel,
        )),
      );
    },
    ContentViewerRoute.name: (routeData) {
      final args = routeData.argsAs<ContentViewerRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i5.ContentViewerScreen(
          key: args.key,
          args: args.args,
        )),
      );
    },
    CreatorProfileRoute.name: (routeData) {
      final args = routeData.argsAs<CreatorProfileRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i6.CreatorProfileScreen(
          key: args.key,
          creatorId: args.creatorId,
          creatorName: args.creatorName,
          creatorUsername: args.creatorUsername,
        )),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i7.DashboardScreen()),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i8.EditProfileScreen()),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i9.FavouritesScreen()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i10.LoginScreen()),
      );
    },
    MyContentRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i11.MyContentScreen()),
      );
    },
    MyWalletRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i12.MyWalletScreen()),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i13.OnBoardingScreen()),
      );
    },
    PurchasedContentRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i14.PurchasedContentScreen()),
      );
    },
    PurchaseContentRoute.name: (routeData) {
      final args = routeData.argsAs<PurchaseContentRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i15.PurchaseContentScreen(
          key: args.key,
          contentModel: args.contentModel,
        )),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i16.RegistrationScreen()),
      );
    },
    SearchResultRoute.name: (routeData) {
      final args = routeData.argsAs<SearchResultRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i17.SearchResultScreen(
          key: args.key,
          searchQuery: args.searchQuery,
        )),
      );
    },
    SplashRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreen(),
      );
    },
    ContactUsRoute.name: (routeData) {
      final args = routeData.argsAs<ContactUsRouteArgs>(
          orElse: () => const ContactUsRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.ContactUsScreen(key: args.key),
      );
    },
    FAQRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.FAQScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      final args = routeData.argsAs<PrivacyPolicyRouteArgs>(
          orElse: () => const PrivacyPolicyRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.PrivacyPolicyScreen(key: args.key),
      );
    },
    TermsNConditionsRoute.name: (routeData) {
      final args = routeData.argsAs<TermsNConditionsRouteArgs>(
          orElse: () => const TermsNConditionsRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.TermsNConditionsScreen(key: args.key),
      );
    },
    UploadContentRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i23.UploadContentScreen()),
      );
    },
    WithdrawMoneyRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i24.WithdrawMoneyScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.BaseListingScreen]
class BaseListingRoute extends _i25.PageRouteInfo<BaseListingRouteArgs> {
  BaseListingRoute({
    _i26.Key? key,
    required String title,
    required _i27.CategoryType type,
    String? categoryId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          BaseListingRoute.name,
          args: BaseListingRouteArgs(
            key: key,
            title: title,
            type: type,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'BaseListingRoute';

  static const _i25.PageInfo<BaseListingRouteArgs> page =
      _i25.PageInfo<BaseListingRouteArgs>(name);
}

class BaseListingRouteArgs {
  const BaseListingRouteArgs({
    this.key,
    required this.title,
    required this.type,
    this.categoryId,
  });

  final _i26.Key? key;

  final String title;

  final _i27.CategoryType type;

  final String? categoryId;

  @override
  String toString() {
    return 'BaseListingRouteArgs{key: $key, title: $title, type: $type, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i2.CategoriesScreen]
class CategoriesRoute extends _i25.PageRouteInfo<void> {
  const CategoriesRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CategoryContentScreen]
class CategoryContentRoute
    extends _i25.PageRouteInfo<CategoryContentRouteArgs> {
  CategoryContentRoute({
    _i26.Key? key,
    required _i27.CategoryModel categoryModel,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CategoryContentRoute.name,
          args: CategoryContentRouteArgs(
            key: key,
            categoryModel: categoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryContentRoute';

  static const _i25.PageInfo<CategoryContentRouteArgs> page =
      _i25.PageInfo<CategoryContentRouteArgs>(name);
}

class CategoryContentRouteArgs {
  const CategoryContentRouteArgs({
    this.key,
    required this.categoryModel,
  });

  final _i26.Key? key;

  final _i27.CategoryModel categoryModel;

  @override
  String toString() {
    return 'CategoryContentRouteArgs{key: $key, categoryModel: $categoryModel}';
  }
}

/// generated route for
/// [_i4.ContentDetailsScreen]
class ContentDetailsRoute extends _i25.PageRouteInfo<ContentDetailsRouteArgs> {
  ContentDetailsRoute({
    _i26.Key? key,
    required _i27.ContentModel contentModel,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ContentDetailsRoute.name,
          args: ContentDetailsRouteArgs(
            key: key,
            contentModel: contentModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ContentDetailsRoute';

  static const _i25.PageInfo<ContentDetailsRouteArgs> page =
      _i25.PageInfo<ContentDetailsRouteArgs>(name);
}

class ContentDetailsRouteArgs {
  const ContentDetailsRouteArgs({
    this.key,
    required this.contentModel,
  });

  final _i26.Key? key;

  final _i27.ContentModel contentModel;

  @override
  String toString() {
    return 'ContentDetailsRouteArgs{key: $key, contentModel: $contentModel}';
  }
}

/// generated route for
/// [_i5.ContentViewerScreen]
class ContentViewerRoute extends _i25.PageRouteInfo<ContentViewerRouteArgs> {
  ContentViewerRoute({
    _i26.Key? key,
    required _i5.ContentViewerScreenArgs args,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ContentViewerRoute.name,
          args: ContentViewerRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'ContentViewerRoute';

  static const _i25.PageInfo<ContentViewerRouteArgs> page =
      _i25.PageInfo<ContentViewerRouteArgs>(name);
}

class ContentViewerRouteArgs {
  const ContentViewerRouteArgs({
    this.key,
    required this.args,
  });

  final _i26.Key? key;

  final _i5.ContentViewerScreenArgs args;

  @override
  String toString() {
    return 'ContentViewerRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i6.CreatorProfileScreen]
class CreatorProfileRoute extends _i25.PageRouteInfo<CreatorProfileRouteArgs> {
  CreatorProfileRoute({
    _i26.Key? key,
    required String creatorId,
    required String creatorName,
    required String creatorUsername,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CreatorProfileRoute.name,
          args: CreatorProfileRouteArgs(
            key: key,
            creatorId: creatorId,
            creatorName: creatorName,
            creatorUsername: creatorUsername,
          ),
          initialChildren: children,
        );

  static const String name = 'CreatorProfileRoute';

  static const _i25.PageInfo<CreatorProfileRouteArgs> page =
      _i25.PageInfo<CreatorProfileRouteArgs>(name);
}

class CreatorProfileRouteArgs {
  const CreatorProfileRouteArgs({
    this.key,
    required this.creatorId,
    required this.creatorName,
    required this.creatorUsername,
  });

  final _i26.Key? key;

  final String creatorId;

  final String creatorName;

  final String creatorUsername;

  @override
  String toString() {
    return 'CreatorProfileRouteArgs{key: $key, creatorId: $creatorId, creatorName: $creatorName, creatorUsername: $creatorUsername}';
  }
}

/// generated route for
/// [_i7.DashboardScreen]
class DashboardRoute extends _i25.PageRouteInfo<void> {
  const DashboardRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EditProfileScreen]
class EditProfileRoute extends _i25.PageRouteInfo<void> {
  const EditProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i9.FavouritesScreen]
class FavouritesRoute extends _i25.PageRouteInfo<void> {
  const FavouritesRoute({List<_i25.PageRouteInfo>? children})
      : super(
          FavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyContentScreen]
class MyContentRoute extends _i25.PageRouteInfo<void> {
  const MyContentRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MyContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyContentRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyWalletScreen]
class MyWalletRoute extends _i25.PageRouteInfo<void> {
  const MyWalletRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MyWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyWalletRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OnBoardingScreen]
class OnBoardingRoute extends _i25.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PurchasedContentScreen]
class PurchasedContentRoute extends _i25.PageRouteInfo<void> {
  const PurchasedContentRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PurchasedContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PurchasedContentRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PurchaseContentScreen]
class PurchaseContentRoute
    extends _i25.PageRouteInfo<PurchaseContentRouteArgs> {
  PurchaseContentRoute({
    _i26.Key? key,
    required _i27.ContentModel contentModel,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          PurchaseContentRoute.name,
          args: PurchaseContentRouteArgs(
            key: key,
            contentModel: contentModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PurchaseContentRoute';

  static const _i25.PageInfo<PurchaseContentRouteArgs> page =
      _i25.PageInfo<PurchaseContentRouteArgs>(name);
}

class PurchaseContentRouteArgs {
  const PurchaseContentRouteArgs({
    this.key,
    required this.contentModel,
  });

  final _i26.Key? key;

  final _i27.ContentModel contentModel;

  @override
  String toString() {
    return 'PurchaseContentRouteArgs{key: $key, contentModel: $contentModel}';
  }
}

/// generated route for
/// [_i16.RegistrationScreen]
class RegistrationRoute extends _i25.PageRouteInfo<void> {
  const RegistrationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SearchResultScreen]
class SearchResultRoute extends _i25.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i26.Key? key,
    required String searchQuery,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          SearchResultRoute.name,
          args: SearchResultRouteArgs(
            key: key,
            searchQuery: searchQuery,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchResultRoute';

  static const _i25.PageInfo<SearchResultRouteArgs> page =
      _i25.PageInfo<SearchResultRouteArgs>(name);
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({
    this.key,
    required this.searchQuery,
  });

  final _i26.Key? key;

  final String searchQuery;

  @override
  String toString() {
    return 'SearchResultRouteArgs{key: $key, searchQuery: $searchQuery}';
  }
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ContactUsScreen]
class ContactUsRoute extends _i25.PageRouteInfo<ContactUsRouteArgs> {
  ContactUsRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ContactUsRoute.name,
          args: ContactUsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static const _i25.PageInfo<ContactUsRouteArgs> page =
      _i25.PageInfo<ContactUsRouteArgs>(name);
}

class ContactUsRouteArgs {
  const ContactUsRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'ContactUsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.FAQScreen]
class FAQRoute extends _i25.PageRouteInfo<void> {
  const FAQRoute({List<_i25.PageRouteInfo>? children})
      : super(
          FAQRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i25.PageRouteInfo<PrivacyPolicyRouteArgs> {
  PrivacyPolicyRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          PrivacyPolicyRoute.name,
          args: PrivacyPolicyRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const _i25.PageInfo<PrivacyPolicyRouteArgs> page =
      _i25.PageInfo<PrivacyPolicyRouteArgs>(name);
}

class PrivacyPolicyRouteArgs {
  const PrivacyPolicyRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'PrivacyPolicyRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i22.TermsNConditionsScreen]
class TermsNConditionsRoute
    extends _i25.PageRouteInfo<TermsNConditionsRouteArgs> {
  TermsNConditionsRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          TermsNConditionsRoute.name,
          args: TermsNConditionsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TermsNConditionsRoute';

  static const _i25.PageInfo<TermsNConditionsRouteArgs> page =
      _i25.PageInfo<TermsNConditionsRouteArgs>(name);
}

class TermsNConditionsRouteArgs {
  const TermsNConditionsRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'TermsNConditionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.UploadContentScreen]
class UploadContentRoute extends _i25.PageRouteInfo<void> {
  const UploadContentRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UploadContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadContentRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.WithdrawMoneyScreen]
class WithdrawMoneyRoute extends _i25.PageRouteInfo<void> {
  const WithdrawMoneyRoute({List<_i25.PageRouteInfo>? children})
      : super(
          WithdrawMoneyRoute.name,
          initialChildren: children,
        );

  static const String name = 'WithdrawMoneyRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
