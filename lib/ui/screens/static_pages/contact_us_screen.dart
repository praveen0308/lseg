import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';

@RoutePage()
class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final data = ConfigManager.instance.getContactUs();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
                    data.phone.toString()),
                getContactUsInfoRow(
                    const Icon(
                      Icons.email,
                      size: 32,
                    ),
                    data.email.toString()),
                getContactUsInfoRow(
                    SvgPicture.asset(AppImages.icTwitter,
                        height: 32, width: 32),
                    data.twitter.toString()),
                getContactUsInfoRow(
                    SvgPicture.asset(
                      AppImages.icInstagram,
                      height: 32,
                      width: 32,
                    ),
                    data.instagram.toString()),
                getContactUsInfoRow(
                    SvgPicture.asset(
                      AppImages.icLinkedIn,
                      height: 32,
                      width: 32,
                    ),
                    data.linkedin.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getContactUsInfoRow(Widget icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          )
        ],
      ),
    );
  }
}
