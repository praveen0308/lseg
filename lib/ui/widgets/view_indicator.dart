import 'package:flutter/material.dart';

class IndicatorView extends StatelessWidget {
  final int length;
  final int activeIndex;
  final int indicatorSize;
  final MainAxisAlignment alignment;

  const IndicatorView({
    super.key,
    required this.length,
    required this.activeIndex,
    this.indicatorSize = 11,
    this.alignment = MainAxisAlignment.end,

  });

  List<Widget> generateIndicatorItems() {
    return List.generate(
        length, (index) => indicatorItemView(activeIndex == index));
  }

  Widget indicatorItemView(bool isActive) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 11,
      width: 11,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(8)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: alignment,
        children: generateIndicatorItems(),
      ),
    );
  }
}
