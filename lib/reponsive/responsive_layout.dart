import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  }) : super(key: key);
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth < 500) {
          return mobileScaffold;
        } else if (Constraints.maxWidth < 1000) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
