import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';

@RoutePage()
class TermsNConditionsScreen extends StatelessWidget {
  TermsNConditionsScreen({super.key});

  final data = ConfigManager.instance.getTermsNConditions();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: HtmlWidget(
        data,
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
