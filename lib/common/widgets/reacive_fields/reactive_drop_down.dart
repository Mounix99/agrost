import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PlantDropDown extends StatelessWidget {
  final Function(FormControl<Object?>)? onChanged;
  final FormControl<Object?>? formControl;
  final Widget icon;
  final ThemeData theme;
  final String? hint;
  final FocusNode? focusNode;
  final List<DropdownMenuItem<Object?>> items;
  const PlantDropDown(
      {Key? key,
      this.formControl,
      required this.icon,
      required this.theme,
      required this.items,
      this.onChanged,
      this.hint,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField(
        onChanged: onChanged,
        focusNode: focusNode,
        decoration: InputDecoration(hintText: hint, prefixIcon: icon),
        formControl: formControl,
        items: items);
  }
}
