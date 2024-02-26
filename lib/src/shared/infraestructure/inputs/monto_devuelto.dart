import 'package:formz/formz.dart';

// Define input validation errors
enum MontoDevueltoError { empty, value }

// Extend FormzInput and provide the input type and error type.
class MontoDevuelto extends FormzInput<double, MontoDevueltoError> {
  // Call super.pure to represent an unmodified form input.
  const MontoDevuelto.pure() : super.pure(0.0);

  // Call super.dirty to represent a modified form input.
  const MontoDevuelto.dirty(double value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == MontoDevueltoError.empty) return 'El campo es requerido';
    if (displayError == MontoDevueltoError.value) return 'Tiene que ser numero cero o mayor';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  MontoDevueltoError? validator(double value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return MontoDevueltoError.empty;
    }
    if (value < 0) return MontoDevueltoError.value;

    return null;
  }
}
