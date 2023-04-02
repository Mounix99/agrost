import 'package:flutter/material.dart';

BoxDecoration roundedGrayDecorationForNavBar(ThemeData theme, isSelected) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(56),
    color: isSelected ? theme.colorScheme.onSurface : theme.colorScheme.surface,
  );
}
