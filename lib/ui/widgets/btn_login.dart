import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lseg/res/res.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onClick;
  const LoginButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onClick, child: Row(
      children: [
        const Expanded(child: Text(AppStrings.getStartedWithGoogle),),
        SvgPicture.asset(
            AppImages.icGoogle,
            semanticsLabel: 'Google'
        )
      ],
    ),

    );
  }
}
