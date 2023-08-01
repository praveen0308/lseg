import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/widgets/btn_action.dart';
import 'package:lseg/ui/widgets/view_menu_item.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with BasePageState{
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 104,

                  decoration: const BoxDecoration(
                      color: AppColors.greyBgColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                ),
                const Positioned(left:0,right: 0,bottom:-50,child: CircleAvatar(radius: 50,backgroundColor: AppColors.greyLight,))
              ],
            ),
            vGap(height: 60),
            Text("Bodoni Ornaments",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            Text("Devanagari Sangam MN",style: TextStyle(fontSize: 16),),
            vGap(),
            SizedBox(
              width: 135,
              child: ActionButton(onClick: (){
                AutoRouter.of(context).push(const EditProfileRoute());
              }, title: AppStrings.editProfile,),
            ),
            vGap(),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MenuItemView(title: AppStrings.myContent, onClick: () {
                  AutoRouter.of(context).push(const MyContentRoute());
                },),
                MenuItemView(title: AppStrings.myWallet, onClick: () {
                  AutoRouter.of(context).push(const MyWalletRoute());
                },),
                MenuItemView(title: AppStrings.faq, onClick: () {
                  AutoRouter.of(context).push(const FAQRoute());
                },),
                MenuItemView(title: AppStrings.contactUs, onClick: () {
                  AutoRouter.of(context).push(const ContactUsRoute());
                },),
                MenuItemView(title: AppStrings.logOut, onClick: () {

                },),
              ],
            ),
            vGap(),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: "Terms",
                          style:
                          const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO navigate to Terms page
                            }),
                      const TextSpan(text: " and "),
                      TextSpan(
                          text: "Privacy Policy",
                          style:
                          const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO navigate to Privacy page
                            }),
                    ]))
          ],
        ),
      ),
    );
  }
}
