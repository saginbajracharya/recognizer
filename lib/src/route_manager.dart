import 'package:flutter/material.dart';
import 'package:recognizer/src/modules/recognizer/recognizer_view.dart';
import 'package:recognizer/src/modules/sample_feature/sample_item_details_view.dart';
import 'package:recognizer/src/modules/sample_feature/sample_item_list_view.dart';
import 'package:recognizer/src/modules/settings/settings_controller.dart';
import 'package:recognizer/src/modules/settings/settings_view.dart';

class RouteManager extends StatelessWidget {
  const RouteManager({Key? key, required this.settings, required this.controller}) : super(key: key);

  final RouteSettings settings;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    switch (settings.name) {
      case SettingsView.routeName:
        return SettingsView(controller: controller);
      case SampleItemDetailsView.routeName:
        return const SampleItemDetailsView();
      case SampleItemListView.routeName:
        return const SampleItemDetailsView();
      case RecognizerView.routeName:
      default:
        return const RecognizerView();
    }
  }
}