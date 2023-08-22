import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/withdraw_money/withdrawal_success_dialog.dart';
import 'package:lseg/ui/widgets/widgets.dart';

import 'withdraw_money_screen_cubit.dart';

@RoutePage()
class WithdrawMoneyScreen extends StatefulWidget implements AutoRouteWrapper{
  const WithdrawMoneyScreen({super.key});

  @override
  State<WithdrawMoneyScreen> createState() => _WithdrawMoneyScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => WithdrawMoneyScreenCubit(), child: this);
  }
}

class _WithdrawMoneyScreenState extends State<WithdrawMoneyScreen> with BasePageState{
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            AppStrings.withdraw,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          vGap(),
          TextInputFieldView(label: AppStrings.paymentDetails, textEditingController: TextEditingController()),
          label(AppStrings.amount),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,

                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.icRupeeCircle,height: 30,width: 30,),
                const SizedBox(width: 16,),
                const Text("10,000.50",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(onPressed: (){

            var dialog = showGeneralDialog(
              context: context,
              barrierColor: Colors.white, // Background color
              barrierDismissible: false,
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (_, __, ___) {
                return const WithdrawalSuccessDialog();
              },
            );
            Timer(const Duration(seconds: 2), () {
              AutoRouter.of(context).navigate(const MyWalletRoute());
            });
          }, child: const Text(AppStrings.withdraw)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 48),
            child: Text(AppStrings.withdrawalMessage,textAlign: TextAlign.center,style: TextStyle(color: AppColors.secondaryTextColor),),
          )

        ],
      ),
    );
  }
}
