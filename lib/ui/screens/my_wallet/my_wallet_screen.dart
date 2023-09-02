import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';

import 'my_wallet_screen_cubit.dart';

@RoutePage()
class MyWalletScreen extends StatefulWidget implements AutoRouteWrapper {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => MyWalletScreenCubit(
              RepositoryProvider.of<UserRepositoryImpl>(context),
            ),
        child: this);
  }
}

class _MyWalletScreenState extends State<MyWalletScreen> with BasePageState {
  @override
  void initState() {
    BlocProvider.of<MyWalletScreenCubit>(context).fetchWalletBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      toolbarActionEnabled: false,
      body: BlocConsumer<MyWalletScreenCubit, MyWalletScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is LoadingWalletBalance) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadWalletBalanceFailed) {
            return Column(
              children: [
                const Icon(
                  Icons.error_rounded,
                  size: 100,
                ),
                vGap(),
                const Text("Something went wrong!!!"),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MyWalletScreenCubit>(context)
                          .fetchWalletBalance();
                    },
                    child: const Text("Retry"))
              ],
            );
          }
          if (state is ReceivedWalletBalance) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  AppStrings.myWallet,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                vGap(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.icRupeeCircle,
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        state.balance.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                /*OutlinedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const WithdrawMoneyRoute());
                  },
                  child: const Text(AppStrings.withdrawalHistory),
                ),*/
                vGap(),
                ElevatedButton(
                    onPressed: state.balance == 0
                        ? null
                        : () {
                            AutoRouter.of(context)
                                .push(const WithdrawMoneyRoute());
                          },
                    child: const Text(AppStrings.withdraw)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 48),
                  child: Text(
                    AppStrings.withdrawalMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.secondaryTextColor),
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
