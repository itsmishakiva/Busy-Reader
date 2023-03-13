import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension RoutePicker on BuildContext {
  StackRouter get router => AutoRouter.of(this);

  TabsRouter get tabsRouter => AutoTabsRouter.of(this);
}