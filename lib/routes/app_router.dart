part of 'route_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashRoute.page),
        AutoRoute(page: OnBoardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: UploadContentRoute.page),
        AutoRoute(page: BaseListingRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: ContentDetailsRoute.page),
        AutoRoute(page: CreatorProfileRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: MyContentRoute.page),
        AutoRoute(page: MyWalletRoute.page),
        AutoRoute(page: SearchResultRoute.page),
        AutoRoute(page: ContactUsRoute.page),
        AutoRoute(page: FAQRoute.page),
        AutoRoute(page: WithdrawMoneyRoute.page),
        AutoRoute(page: FavouritesRoute.page),
        AutoRoute(page: CategoryContentRoute.page),
        AutoRoute(page: ContentViewerRoute.page),
        AutoRoute(page: PurchaseContentRoute.page),
        AutoRoute(page: PurchasedContentRoute.page),
        AutoRoute(page: CreatorProfileRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsNConditionsRoute.page),
        AutoRoute(page: EditContentRoute.page),

      ];
}
