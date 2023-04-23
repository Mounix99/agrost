import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final ThemeData theme;
  final IconData icon;
  final double? radius;
  final Function()? onPressed;
  const CircularIconButton({Key? key, required this.theme, required this.icon, this.radius, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onPressed != null) {
      return CircleAvatar(
          radius: radius ?? 16,
          backgroundColor: theme.colorScheme.surface,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: theme.colorScheme.primary,
            ),
            padding: EdgeInsets.zero,
          ));
    }
    return CircleAvatar(
      radius: radius ?? 16,
      backgroundColor: theme.colorScheme.surface,
      child: Icon(icon, size: radius ?? 20),
    );
  }
}
