import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';

@RoutePage()
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(AppStrings.contactUs,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary, width: 2)
            ),
            child: Column(
              children: [
                getContactUsInfoRow(const Icon(Icons.call,size: 32,), AppConstants.contactUsMobileNo),
                getContactUsInfoRow(const Icon(Icons.email,size: 32,), AppConstants.contactUsEmail),
                getContactUsInfoRow(SvgPicture.asset(AppImages.icTwitter,height: 32,width: 32), AppConstants.contactUsTwitter),
                getContactUsInfoRow(SvgPicture.asset(AppImages.icInstagram,height: 32,width: 32,), AppConstants.contactUsInstagram),
                getContactUsInfoRow(SvgPicture.asset(AppImages.icLinkedIn,height: 32,width: 32,), AppConstants.contactUsLinkedIn),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getContactUsInfoRow(Widget icon, String title){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 16,),
          Text(title,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),)
        ],
      ),
    );
  }
}
