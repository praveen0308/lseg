import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/widgets/view_leaderboard_item.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> with BasePageState {
  final earners = [];

  @override
  void initState() {
    for (int i = 0; i < 50; i++) {
      earners.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Text(
                  AppStrings.topEarners,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                hGap(),
                IconButton(
                  icon: const Icon(Icons.help_rounded),
                  onPressed: () => _dialogBuilder(context),
                ),
                const Spacer(),
                SvgPicture.asset(AppImages.icRupeeCircleFilled),
                hGap()
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.upcoming_rounded,
                  size: 100,
                ),
                vGap(),
                const Text(
                  "Coming Soon!!!",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          )),
          /*Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowBehaviour(),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return LeaderBoardItemView(rank: index + 1);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: earners.length,
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leaderboard Pricing Distribution'),
          content: const Text(
            "You will be paid in two ways either by commission (Paid Notes) and/or Learn and Earn Fund (Free Notes). Our unique scoring system ensures that your efforts are rewarded. The more views, quality, and positive reviews your content receives, the more you earn.",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
