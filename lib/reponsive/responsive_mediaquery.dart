import 'package:flutter/material.dart';

class ResponsiveMediaQuery extends StatelessWidget {
  const ResponsiveMediaQuery({
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
    return Container();
  }
}
