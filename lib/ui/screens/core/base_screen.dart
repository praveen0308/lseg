import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/widgets/toolbar_base.dart';
import 'package:lseg/ui/widgets/toolbar_main.dart';
import 'package:lseg/utils/utils.dart';

import 'base_page.dart';

class BaseScreen extends StatefulWidget {
  final String title;
  final bool isIcon;
  final String action;
  final Widget body;
  final Function()? onAction;
  final Function()? onPressed;
  final Widget? bottomNav;
  final bool isFloatingBtn;
  final String navigateTo;
  final Object? args;
  final String floatingIcon;
  final bool applyScroll;
  final bool enableAppBar;
  final bool homeAppBar;
  final bool isLinearShade;
  final bool isTabView;
  final String? pageBackground;
  final EdgeInsetsGeometry pagePadding;
  final ToolbarController? toolbarController;
  final VoidCallback? onPrimaryActionClick;
  final VoidCallback? onSecondaryClick;
  final bool? isToolbarStacked;
  final Color? toolbarBackgroundColor;

  final Function(dynamic data)? navigationCallback;

  const BaseScreen({
    Key? key,
    this.title = "",
    this.isIcon = false,
    this.onAction,
    required this.body,
    this.action = "",
    this.bottomNav,
    this.navigateTo = "",
    this.isFloatingBtn = false,
    this.floatingIcon = AppImages.icAdd,
    this.applyScroll = true,
    this.enableAppBar = true,
    this.homeAppBar = false,
    this.navigationCallback,
    this.onPressed,
    this.isLinearShade = false,
    this.isTabView = false,
    this.args,
    this.pageBackground,
    this.pagePadding = const EdgeInsets.symmetric(
        horizontal: AppDimens.appHorizontalSpacing,
        vertical: AppDimens.appVerticalPadding),
    this.toolbarController,
    this.onPrimaryActionClick,
    this.onSecondaryClick, this.isToolbarStacked=false, this.toolbarBackgroundColor,
  }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with BasePageState {
  bool isInternetConnected = false;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledToTop = true;

  @override
  Future<bool> checkInternetConnection() async {
    isInternetConnected =
        await InternetConnectivityHelper.checkInternetConnectivity();
    if (isInternetConnected) {
      return true;
    } else {
      showNotInternetDialog();
      return false;
    }
  }

  @override
  void initState() {
    checkInternetConnection();
    super.initState();
    _scrollController.addListener(_scrollListener);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: AppColors.primary));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isScrolledToTop = true;
      });
    } else {
      setState(() {
        _isScrolledToTop = false;
      });
    }
  }

  void _handleRefresh() {
    // Perform your refresh action here
    // This method will be called when the user scrolls down from the top
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double sMobile = AppDimens.appSmallDevice;
    return RefreshIndicator(
      onRefresh: () async {
        _handleRefresh();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: widget.enableAppBar
              ? PreferredSize(
                  preferredSize:
                      Size.fromHeight((width <= sMobile) ? 60.0 : 70.0),
                  child: widget.homeAppBar
                      ? MainToolbar(
                          title: widget.title,
                          controller: widget.toolbarController,
                          onPrimaryActionClick: widget.onPrimaryActionClick,
                          onSecondaryClick: widget.onSecondaryClick,
                        )
                      : BaseToolbar(
                          title: widget.title,
                          onPrimaryActionClick: widget.onPrimaryActionClick,
                          onSecondaryClick: widget.onSecondaryClick,
                        ),
                )
              : null,
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.greyLightest,
                    widget.isLinearShade
                        ? AppColors.primaryLight1
                        : AppColors.greyLightest,
                  ],
                  stops: const [
                    0.0,
                    5.0
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated),
            ),
            child: widget.applyScroll
                ? ScrollConfiguration(
                    behavior: NoGlowBehaviour(),
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Padding(
                        padding: widget.pagePadding,
                        child: widget.body,
                      ),
                    ),
                  )
                : Padding(
                    padding: widget.pagePadding,
                    child: widget.body,
                  ),
          ),
          bottomNavigationBar: widget.bottomNav,
          floatingActionButton: Visibility(
            visible: widget.isFloatingBtn,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                widget.onPressed ??
                    navigateTo(widget.navigateTo, args: widget.args)
                        .then((value) => widget.navigationCallback!(value));
              },
              backgroundColor: AppColors.primary,
              child: SvgPicture.asset(
                widget.floatingIcon,
                color: AppColors.greyLightest,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
