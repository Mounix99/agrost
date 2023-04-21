import 'package:reactive_forms/reactive_forms.dart';

export 'package:reactive_forms/reactive_forms.dart';

extension FormGroupShorts on FormGroup {
  T? val<T>(Enum enumValue) => ctrl<T>(enumValue).value;

  T? valIfDirty<T>(Enum enumValue, {T? defaultValue}) {
    final control = ctrl<T>(enumValue);
    return control.dirty ? control.value : defaultValue;
  }

  FormControl<T> ctrl<T>(Enum enumValue) {
    return control(enumValue.name) as FormControl<T>;
  }

  void setVal<T>(Enum enumValue, T value) {
    ctrl<T>(enumValue).value = value;
  }
}
