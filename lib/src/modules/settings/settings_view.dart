import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recognizer/src/common/styles.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    String versionText = '';
    if (kDebugMode) {
      print(versionText);
    }
    dynamic textStyles = TextStyles(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10.0),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          children: [
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
              underline: const SizedBox(),
              isExpanded: true,
              isDense: false,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 20.0),
              child: FutureBuilder<String>(
                future: getVersionNumber(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    versionText = snapshot.data!;
                    return Text('Version : ${snapshot.data}', style: textStyles.subheading);
                  } else {
                    return Text('', style: textStyles.subheading);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
