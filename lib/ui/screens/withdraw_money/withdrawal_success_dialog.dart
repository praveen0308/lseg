import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';

class WithdrawalSuccessDialog extends StatelessWidget {
  const WithdrawalSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_rounded,size: 173,),
        Text(AppStrings.withdrawalSuccessful)

      ],
    );
  }
}
