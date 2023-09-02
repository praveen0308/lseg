import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/login/login_screen_cubit.dart';
import 'package:lseg/ui/widgets/btn_login.dart';
import 'package:lseg/utils/utils.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => LoginScreenCubit(
            RepositoryProvider.of<AuthRepositoryImpl>(context)),
        child: this);
  }
}

class _LoginScreenState extends State<LoginScreen> with BasePageState {
  var tncAccepted = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgLogin),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocListener<LoginScreenCubit, LoginScreenState>(
            listener: (context, state) {
              showLoading(state is LoggingIn);
              if (state is LoginSuccessful) {
                showToast("Login Successful", ToastType.success);
                // AutoRouter.of(context).push(const RegistrationRoute());
              }
              if (state is UserExists) {
                showToast("Welcome to the App", ToastType.success);
                AutoRouter.of(context).push(const DashboardRoute());
              }
              if (state is UserDoesNotExists) {
                AutoRouter.of(context).replace(const RegistrationRoute());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Image.asset(
                      AppImages.icLogo2,
                  scale: 0.5,
                )),
                LoginButton(onClick: () {
                  if (tncAccepted) {
                    BlocProvider.of<LoginScreenCubit>(context).login();
                  } else {
                    showToast("Please accept terms and conditions!!!",
                        ToastType.error);
                  }
                }),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: tncAccepted,
                  onChanged: (v) {
                    setState(() {
                      tncAccepted = v ?? false;
                    });
                  },
                  title: RichText(
                      text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                        const TextSpan(text: "I agree with "),
                        TextSpan(
                            text: "Terms & Conditions",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context)
                                    .push(TermsNConditionsRoute());
                              }),
                        const TextSpan(text: " and "),
                        TextSpan(
                            text: "Privacy",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context)
                                    .push(PrivacyPolicyRoute());
                              }),
                      ])),
                )
              ],
            ),
          ),
        ));
  }
}
