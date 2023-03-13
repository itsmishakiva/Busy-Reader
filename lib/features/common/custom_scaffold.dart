import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body, this.bottomNavigationBar})
      : super(key: key);
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).brightness,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Theme.of(context).brightness == Brightness.light
                    ? Brightness.dark
                    : Brightness.light,
          ),
          child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
