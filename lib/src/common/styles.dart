
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color white        = Colors.white;
const Color black        = Colors.black;
const Color teal         = Colors.teal;
const Color indigo       = Colors.indigo;
const Color indigoAccent = Colors.indigoAccent;
const Color grey         = Colors.grey;
Color? grey200           = Colors.grey[200];
Color? grey300           = Colors.grey[300];
Color? grey400           = Colors.grey[400];
Color? grey500           = Colors.grey[500];
Color? grey600           = Colors.grey[600];
Color? grey700           = Colors.grey[700];
Color? grey800           = Colors.grey[800];
Color? grey900           = Colors.grey[900];
const Color blue         = Colors.blue;
const Color cyan         = Colors.cyan;
const Color red          = Colors.red;
const Color yellow       = Colors.yellow;
const Color green        = Colors.green;
const Color orange       = Colors.orange;
const Color pink         = Colors.pink;
const Color purple       = Colors.purple;
const Color brown        = Colors.brown;
const Color lime         = Colors.lime;
const Color transparent  = Colors.transparent;

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: teal,
  scaffoldBackgroundColor: grey200,
  appBarTheme: AppBarTheme(
    color: transparent,
    iconTheme: IconThemeData(
      color: grey800,
    ),
    titleTextStyle: TextStyle(
      color: grey800
    ),
    elevation: 0,
    surfaceTintColor: transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: black.withOpacity(0.2), // Optional: set your desired status bar color
      statusBarBrightness: Brightness.light, // Set status bar text color to light
      statusBarIconBrightness: Brightness.dark, // Set status bar icons to dark color
    ),
  ),
  cardTheme: CardTheme(
    color: grey300,
    elevation: 1
  ),
  iconTheme: IconThemeData(
    color: grey800,
    shadows: [
      Shadow(
        color: black.withOpacity(0.2),
        blurRadius: 4.0,
        offset: const Offset(0, 1), // Adjust the offset to control the shadow direction
      ),
    ],
  ),
  textTheme: TextTheme(
    displayLarge:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    displayMedium:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    displaySmall:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    headlineLarge:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    headlineMedium:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    headlineSmall:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    titleLarge:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    titleMedium:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    titleSmall:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    bodyLarge:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    bodyMedium:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    bodySmall:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    labelLarge:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    labelMedium:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
    labelSmall:TextStyle(
      color: grey800,
      fontSize: 14.0,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.teal, // Change button color here
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal, // Change elevated button color here
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all<Color?>(grey800),
    fillColor:MaterialStateProperty.all<Color?>(grey400),
    overlayColor:MaterialStateProperty.all<Color?>(grey800),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0), // You can adjust the radius as needed
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: grey800, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // You can adjust the radius as needed
      ),
      side: BorderSide(color: grey800!), // Change outline color here
      padding: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 14,
        color: grey800,
      )
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(grey800), // Customize the thumb color
    thumbVisibility: MaterialStateProperty.all(true), // Show the thumb
    thickness: MaterialStateProperty.all(8.0), // Set the thickness of the thumb
    trackColor: MaterialStateProperty.all(transparent), // Customize the track color
    trackBorderColor: MaterialStateProperty.all(transparent), // Customize the track border color
    radius: const Radius.circular(8.0), // Set the radius of the thumb
    crossAxisMargin: 0.0, // Add margin along the cross axis
    mainAxisMargin: 16.0, // Add margin along the main axis
    interactive: true, // Enable scrollbar interaction
  )
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: indigo,
  scaffoldBackgroundColor: grey900,
  appBarTheme: AppBarTheme(
    color: transparent,
    iconTheme: IconThemeData(
      color: grey200,
    ),
    titleTextStyle: TextStyle(
      color: grey200
    ),
    elevation: 0,
    surfaceTintColor: transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: black.withOpacity(0.2), // Optional: set your desired status bar color
      statusBarBrightness: Brightness.dark, // Set status bar text color to dark
      statusBarIconBrightness: Brightness.light, // Set status bar icons to light color
    ),
  ),
  cardTheme: CardTheme(
    color: grey800,
    elevation: 1
  ),
  iconTheme: IconThemeData(
    color: grey200,
    shadows: [ 
      Shadow(
        color: white.withOpacity(0.2),
        blurRadius: 4.0,
        offset: const Offset(0, 1), // Adjust the offset to control the shadow direction
      ),
    ]
  ),
  textTheme: TextTheme(
    displayLarge:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    displayMedium:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    displaySmall:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    headlineLarge:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    headlineMedium:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    headlineSmall:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    titleLarge:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    titleMedium:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    titleSmall:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    bodyLarge:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    bodyMedium:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    bodySmall:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    labelLarge:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    labelMedium:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
    labelSmall:TextStyle(
      color: grey200,
      fontSize: 14.0,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: indigo, // Change button color here
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: indigo, // Change elevated button color here
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all<Color?>(grey200),
    fillColor:MaterialStateProperty.all<Color?>(grey800),
    overlayColor:MaterialStateProperty.all<Color?>(grey800),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0), // You can adjust the radius as needed
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: grey200, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // You can adjust the radius as needed
      ),
      side: BorderSide(color: grey200!), // Change outline color here
      padding: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 14,
        color: grey200,
      )
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(grey200), // Customize the thumb color
    thumbVisibility: MaterialStateProperty.all(true), // Show the thumb
    thickness: MaterialStateProperty.all(8.0), // Set the thickness of the thumb
    trackColor: MaterialStateProperty.all(transparent), // Customize the track color
    trackBorderColor: MaterialStateProperty.all(transparent), // Customize the track border color
    radius: const Radius.circular(8.0), // Set the radius of the thumb
    crossAxisMargin: 0.0, // Add margin along the cross axis
    mainAxisMargin: 16.0, // Add margin along the main axis
    interactive: true, // Enable scrollbar interaction
  ),
);

class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  TextStyle get appBarText {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }
  
  TextStyle get heading {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? grey200 : grey800;
    return TextStyle(
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get subheading {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? grey200 : grey800;
    return TextStyle(
      fontSize: 18,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get body {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? grey200 : grey800;
    return TextStyle(
      fontSize: 16,
      color: color,
    );
  }

  TextStyle get caption {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? grey200 : grey800;
    return TextStyle(
      fontSize: 14,
      color: color,
    );
  }

  TextStyle get button {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? grey200 : grey800;
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.bold
    );
  }

  TextStyle get emptyText {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.dark ? grey200 : grey800;
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
