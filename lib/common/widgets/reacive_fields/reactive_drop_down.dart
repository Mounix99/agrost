import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PlantDropDown extends StatelessWidget {
  final Function(FormControl<Object?>)? onChanged;
  final FormControl<Object?>? formControl;
  final Widget icon;
  final ThemeData theme;
  final String? hint;
  final List<DropdownMenuItem<Object?>> items;
  const PlantDropDown(
      {Key? key,
      this.formControl,
      required this.icon,
      required this.theme,
      required this.items,
      this.onChanged,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primaryContainer),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                )),
            prefixIcon: icon),
        formControl: formControl,
        items: items);
  }
}
