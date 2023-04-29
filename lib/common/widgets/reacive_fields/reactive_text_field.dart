import 'package:flutter/material.dart';

import '../../extensions/forms.dart';
import '../../styles/plant_icons.dart';

class PlantTextField extends StatelessWidget {
  final ThemeData theme;
  final FormControl? control;
  final Map<String, String Function(Object)>? validation;
  final String? hint;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  const PlantTextField(
      {Key? key,
      required this.theme,
      this.control,
      this.validation,
      this.hint,
      this.icon,
      this.keyboardType,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
        key: key,
        showErrors: (control) => control.invalid && control.touched,
        formControl: control,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType ?? TextInputType.text,
        validationMessages: validation,
        decoration: InputDecoration(
            hintText: hint, prefixIcon: Icon(icon ?? PlantIcons.edit_2, color: theme.colorScheme.primary)));
  }
}
