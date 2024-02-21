import 'package:formz/formz.dart';

// Define input validation errors
enum FechaOperacionError { empty }

// Extend FormzInput and provide the input type and error type.
class FechaOperacion extends FormzInput<String, FechaOperacionError> {



  // Call super.pure to represent an unmodified form input.
  const FechaOperacion.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const FechaOperacion.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == FechaOperacionError.empty ) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  FechaOperacionError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return FechaOperacionError.empty;

    return null;
  }
}