import 'package:flutter/material.dart';

import '../../extentions/forms.dart';
import '../../styles/plant_icons.dart';

class PlantTextField extends StatelessWidget {
  final ThemeData theme;
  final FormControl<String?>? control;
  final Map<String, String Function(Object)>? validation;
  final String? hint;
  const PlantTextField({Key? key, required this.theme, this.control, this.validation, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
        showErrors: (control) => control.invalid && control.touched,
        formControl: control,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        validationMessages: validation,
        decoration: InputDecoration(
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
            errorStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primaryContainer),
            hintText: hint,
            helperStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primaryContainer),
            prefixIcon: Icon(PlantIcons.edit_2, color: theme.colorScheme.primary)));
  }
}
