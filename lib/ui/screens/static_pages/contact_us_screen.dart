import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/utils/util_methods.dart';

@RoutePage()
class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final data = ConfigManager.instance.getContactUs();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      toolbarActionEnabled: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            AppStrings.contactUs,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primary, width: 2)),
            child: Column(
              children: [
                getContactUsInfoRow(
                    const Icon(
                      Icons.call,
                      size: 32,
                    ),
                    data.phone.toString(),(){
                      LauncherUtils.openPhone(data.phone.toString());
                }),
                getContactUsInfoRow(
                    const Icon(
                      Icons.email,
                      size: 32,
                    ),
                    data.email.toString(),(){
                  LauncherUtils.openEmail(data.email.toString(),"Email Subject","Body");
                }),
                getContactUsInfoRow(
                    SvgPicture.asset(AppImages.icTwitter,
                        height: 32, width: 32),
                    data.twitter.toString(),(){
                  LauncherUtils.openWebsite(data.twitter.toString());
                }),
                getContactUsInfoRow(
                    SvgPicture.asset(
                      AppImages.icInstagram,
                      height: 32,
                      width: 32,
                    ),
                    data.instagram.toString(),(){
                  LauncherUtils.openWebsite(data.instagram.toString());
                }),
                getContactUsInfoRow(
                    SvgPicture.asset(
                      AppImages.icLinkedIn,
                      height: 32,
                      width: 32,
                    ),
                    data.linkedin.toString(),(){
                  LauncherUtils.openWebsite(data.linkedin.toString());
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getContactUsInfoRow(Widget icon, String title,VoidCallback onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
