import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recognizer/src/common/styles.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:recognizer/src/widgets/base_layout.dart';
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
      body: BaseLayout(
        customMargin: const EdgeInsets.only(left:20.0,right:20.0,bottom:20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: DropdownButton<ThemeMode>(
                // Read the selected themeMode from the controller
                value: controller.themeMode,
                // Call the updateThemeMode method any time the user selects a theme.
                onChanged: controller.updateThemeMode,
                underline: const SizedBox(),
                isExpanded: true,
                isDense: false,
                style: textStyles.subheading,
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: SizedBox(
                width: double.infinity,
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
            ),
          ],
        ),
      ),
    );
  }
}
