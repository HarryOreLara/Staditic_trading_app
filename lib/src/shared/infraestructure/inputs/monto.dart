import 'package:formz/formz.dart';

// Define input validation errors
enum MontoError { empty, value }

// Extend FormzInput and provide the input type and error type.
class Monto extends FormzInput<double, MontoError> {
  // Call super.pure to represent an unmodified form input.
  const Monto.pure() : super.pure(0.0);

  // Call super.dirty to represent a modified form input.
  const Monto.dirty(double value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == MontoError.empty) return 'El campo es requerido';
    if (displayError == MontoError.value)
      return 'Tiene que ser numero cero o mayor';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  MontoError? validator(double value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return MontoError.empty;
    }
    if (value < 0) return MontoError.value;

    return null;
  }
}
