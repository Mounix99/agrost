import 'package:flutter/material.dart';

class SecondaryTabBar extends StatelessWidget {
  static const tabHeight = 36.0;
  final TabController controller;
  final List<Tab> tabs;
  final ValueChanged<int>? onTap;
  final bool isScrollable;

  const SecondaryTabBar({Key? key, required this.tabs, required this.controller, this.onTap, this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100), side: BorderSide(color: theme.colorScheme.onSurface, width: 1)),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), side: BorderSide(color: theme.colorScheme.surface, width: 3)),
        child: TabBar(
          controller: controller,
          isScrollable: isScrollable,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: theme.colorScheme.onSurface,
          ),
          splashBorderRadius: BorderRadius.circular(100),
          labelPadding: EdgeInsets.zero,
          labelStyle: theme.textTheme.titleMedium,
          labelColor: theme.colorScheme.primary,
          unselectedLabelStyle: theme.textTheme.titleMedium,
          unselectedLabelColor: theme.colorScheme.onPrimary,
          tabs: tabs,
          onTap: onTap,
        ),
      ),
    );
  }
}
