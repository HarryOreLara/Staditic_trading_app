import 'package:formz/formz.dart';

// Define input validation errors
enum MontoInvertidoError { empty, value }

// Extend FormzInput and provide the input type and error type.
class MontoInvertido extends FormzInput<double, MontoInvertidoError> {
  // Call super.pure to represent an unmodified form input.
  const MontoInvertido.pure() : super.pure(0.0);

  // Call super.dirty to represent a modified form input.
  const MontoInvertido.dirty(double value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == MontoInvertidoError.empty) return 'El campo es requerido';
    if (displayError == MontoInvertidoError.value) return 'Tiene que ser numero cero o mayor';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  MontoInvertidoError? validator(double value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return MontoInvertidoError.empty;
    }
    if (value < 0) return MontoInvertidoError.value;

    return null;
  }
}
