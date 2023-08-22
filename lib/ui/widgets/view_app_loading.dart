import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';

class AppLoadingView extends StatefulWidget {
  final String msg;
  const AppLoadingView({super.key, this.msg = "Loading..."});

  @override
  State<AppLoadingView> createState() => _AppLoadingViewState();
}

class _AppLoadingViewState extends State<AppLoadingView> with TickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.center, children: [
          Image.asset(
            AppImages.icLogo,
            height: 70,
            width: 70,
          ),
          RotationTransition(
            alignment: Alignment.center,
            turns: _controller,
            child: Image.asset(
              AppImages.imgLoading,
              height: 100,
              width: 100,
            ),
          ),
        ]),
        const SizedBox(height: 16,),
        Text(widget.msg,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
      ],
    );
  }
}
