import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? customMargin;
  const BaseLayout({super.key,required this.child,this.customMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: customMargin ?? const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: child,
    );
  }
}